import React from 'react';
import { Box, Heading, Image, Section, Tile } from 'react-bulma-components';

export default () => {
  return (
    <Section>
      <Box>
        <Tile kind="ancestor">
          <Tile size={8} vertical>
            <Tile>
              <Tile kind="parent" vertical>
                <Tile
                  renderAs="article"
                  kind="child"
                  notification
                  color="primary">
                  <Heading>Vertical...</Heading>
                  <Heading subtitle>Top tile</Heading>
                </Tile>
                <Tile
                  renderAs="article"
                  kind="child"
                  notification
                  color="warning">
                  <Heading>Tiles...</Heading>
                  <Heading subtitle>Bottom Tile...</Heading>
                </Tile>
              </Tile>
              <Tile kind="parent">
                <Tile renderAs="article" kind="child" notification color="info">
                  <Heading>Middle Tile...</Heading>
                  <Heading subtitle>With image Tile...</Heading>
                  <Image src="https://scontent-nrt1-1.cdninstagram.com/vp/a66db339ff83752fc9531a7b236ae3d5/5BDC93B2/t51.2885-15/e35/36554636_276534213109379_4141343415403020288_n.jpg" />
                </Tile>
              </Tile>
            </Tile>
            <Tile kind="parent">
              <Tile renderAs="article" kind="child" notification color="danger">
                <Heading>Wide tile</Heading>
                <Heading subtitle>Aligned with the right tile</Heading>
                <div className="content" />
              </Tile>
            </Tile>
          </Tile>
          <Tile kind="parent">
            <Tile renderAs="article" kind="child" notification color="success">
              <div className="content">
                <Heading>Tall tile</Heading>
                <Heading subtitle>With even more content</Heading>
                <div className="content" />
              </div>
            </Tile>
          </Tile>
        </Tile>
      </Box>
    </Section>
  );
};
