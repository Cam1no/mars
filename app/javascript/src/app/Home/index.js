import React from 'react';
import PropTypes from 'prop-types';
import {Columns} from 'react-bulma-components';
// import { connect } from 'react-redux';

class Home extends React.Component {
	constructor(props) {
		super(props);
	}

	render() {
		return (
      <Columns>
        {
          [1, 2, 3, 4, 5].map(i => {
            return(
              <Columns.Column>
        				First Column {`${i}`}
        			</Columns.Column>
            )
          })
        }
		  </Columns>
    )
	}
}

export default Home;
