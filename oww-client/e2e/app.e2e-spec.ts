import { OwwClientPage } from './app.po';

describe('oww-client App', () => {
  let page: OwwClientPage;

  beforeEach(() => {
    page = new OwwClientPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!');
  });
});
