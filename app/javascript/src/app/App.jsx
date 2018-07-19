import React, { Component } from 'react';
import { Switch, Route, Redirect } from 'react-router-dom';
import Home from './Home';


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
