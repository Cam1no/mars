import Brand from './Brand';
import MenuLeft from './MenuLeft';
import MenuRight from './MenuRight';
import React from 'react';
import { Navbar } from 'react-bulma-components';

export default () => {
  return (
    <Navbar>
      <Brand />
      <Navbar.Menu>
        <MenuLeft />
        <MenuRight />
      </Navbar.Menu>
    </Navbar>
  );
};
