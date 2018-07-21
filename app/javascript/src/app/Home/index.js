import Header from './components/Header/';
import Tile from '../SampleComponents/Tile';
import Footer from '../SampleComponents/Footer';
import React from 'react';

class Home extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <Header />
        <Tile />
        <Footer />
      </div>
    );
  }
}

export default Home;
