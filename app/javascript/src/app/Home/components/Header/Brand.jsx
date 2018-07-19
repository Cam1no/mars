import React from 'react';

import { Navbar } from 'react-bulma-components';

const Brand = () => {
  return (
    <Navbar.Brand>
      <Navbar.Item href="#">
        <img
          src="https://bulma.io/images/bulma-logo.png"
          alt="Bulma: a modern CSS framework based on Flexbox"
          width="112"
          height="28"
        />
      </Navbar.Item>
      <Navbar.Burger />
    </Navbar.Brand>
  );
};

export default Brand;
