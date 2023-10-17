import 'package:expense_tracker/expense.dart';
import 'package:expense_tracker/widgets/expense-list/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/expenses.dart';
import 'package:expense_tracker/widgets/expense-list/expenses_list.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/chart/chart_bar.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
   return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{
  final List<Expense> _registeredExpenses = [
    Expense(title: 'Flutter Course', 
    amount: 500, 
    date: DateTime.now(), 
    category: Category.work
    ),
    Expense(title: 'MERN Course', 
    amount: 500, 
    date: DateTime.now(), 
    category: Category.work
    ),
    Expense(title: 'Train Ticket', 
    amount: 1200, 
    date: DateTime.now(), 
    category: Category.travel
    ),
    Expense(title: 'Biscuit', 
    amount: 500, 
    date: DateTime.now(), 
    category: Category.food
    ),
  ];

  void _openAddExpenseOverlay(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: 
      (ctx) => NewExpense(
        onAddExpense: _addExpense
        ),
    );
  }

void _addExpense(Expense expense){
  setState(() {
    _registeredExpenses.add(expense);
  });
  
}

void _removeExpense(Expense expense){
  final expenseIndex = _registeredExpenses.indexOf(expense);
  setState(() {
    _registeredExpenses.remove(expense);
  });
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
   
    SnackBar(
      duration: Duration(seconds: 3),
      content: const Text('Expense deleted'),
      action: SnackBarAction(label: 'Undo', onPressed: (){
        setState(() {
          _registeredExpenses.insert(expenseIndex,expense);
        });
      }),
      )
  );
}

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text('No expenses found. Start adding some!..'),);

  if (_registeredExpenses.isNotEmpty){
    mainContent = ExpensesList(expenses : _registeredExpenses,
        onRemoveExpense: _removeExpense,);

  }

    return Scaffold(
     appBar: AppBar(
      title: const Text('Expense Tracker'),
      actions: [
        IconButton(
          onPressed: _openAddExpenseOverlay,
          icon: const Icon(Icons.add)),
      ],
     ), 

      body: Column(
      children: [

        Chart(expenses: _registeredExpenses),
        Expanded(child: mainContent ),
      ],
    ),);
  }
}

 