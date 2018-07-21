import React from 'react';
import { Navbar } from 'react-bulma-components';

const MenuLeft = () => {
  return (
    <Navbar.Container>
      <Navbar.Item dropdown="dropdown" hoverable="hoverable">
        <Navbar.Link>Docs</Navbar.Link>
        <Navbar.Dropdown boxed="boxed">
          <Navbar.Item href="#">Home</Navbar.Item>
          <Navbar.Item href="#">List</Navbar.Item>
          <Navbar.Item href="#">Another Item</Navbar.Item>
          <Navbar.Divider />
          <Navbar.Item active="active" href="#">
            Active
          </Navbar.Item>
        </Navbar.Dropdown>
      </Navbar.Item>
      <Navbar.Item href="#">Second</Navbar.Item>
    </Navbar.Container>
  );
};

export default MenuLeft;
