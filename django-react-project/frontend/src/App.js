import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

const Hello = ({name}) => (
  <div>{`Hello ${name}`}</div>
)

class App extends Component {
  constructor(props){
    super(props)
    console.log('fetching ...')
  }
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcometo React App</h1>
          <Hello name='Evance Soumaoro' />
        </header>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
        </p>
      </div>
    );
  }
}

export default App;
