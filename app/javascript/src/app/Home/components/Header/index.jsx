import React from 'react';
import { Navbar } from 'react-bulma-components';
import Brand from './Brand';
import MenuLeft from './MenuLeft';
import MenuRight from './MenuRight';

const Header = () => {
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

export default Header;
