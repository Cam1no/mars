import React from 'react';
import { Navbar } from 'react-bulma-components';

const MenuRight = () => {
  return (
    <Navbar.Container position="end">
      <Navbar.Item dropdown="dropdown" hoverable="hoverable">
        <Navbar.Link>Other Menu</Navbar.Link>
        <Navbar.Dropdown right="right" boxed="boxed">
          <Navbar.Item href="#">this is aligned to the right</Navbar.Item>
        </Navbar.Dropdown>
      </Navbar.Item>
    </Navbar.Container>
  );
};

export default MenuRight;
