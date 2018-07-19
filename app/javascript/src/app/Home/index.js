import React from 'react';
import PropTypes from 'prop-types';
import Header from './components/Header/';
// import { connect } from 'react-redux';

class Home extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return <Header />;
  }
}

export default Home;
