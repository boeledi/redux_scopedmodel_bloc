import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/case1/bloc/bloc_application.dart';
import 'package:redux_scopedmodel_bloc/case1/redux/redux_application.dart';
import 'package:redux_scopedmodel_bloc/case1/scoped_model/scoped_model_application.dart';
import 'package:redux_scopedmodel_bloc/case2/bloc/bloc_application.dart';
import 'package:redux_scopedmodel_bloc/case2/redux/redux_application.dart';
import 'package:redux_scopedmodel_bloc/case2/scoped_model/scoped_model_application.dart';

void main(){
//  mainCase1Redux();
//  mainCase1ScopedModel();
//  mainCase1Bloc();
//  mainCase2Bloc();
//  mainCase2ScopedModel();
  mainCase2Redux();
}

void mainCase1Redux(){
  runApp(Case1ReduxApplication());
}

void mainCase1ScopedModel(){
  runApp(Case1ScopedModelApplication());
}

void mainCase1Bloc(){
  runApp(Case1BlocApplication());
}

void mainCase2Bloc(){
  runApp(Case2BlocApplication());
}

void mainCase2ScopedModel(){
  runApp(Case2ScopedModelApplication());
}

void mainCase2Redux(){
  runApp(Case2ReduxApplication());
}