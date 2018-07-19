import Home from './Home';
import React, { Component } from 'react';
import { Redirect, Route, Switch } from 'react-router-dom';

class App extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className="app-container">
        <Switch>
          <Route path="/" component={Home} />
        </Switch>
      </div>
    );
  }
}

export default App;
