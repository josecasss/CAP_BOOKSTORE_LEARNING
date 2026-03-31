sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"bookstorelistviewfjcm/test/integration/pages/BooksList",
	"bookstorelistviewfjcm/test/integration/pages/BooksObjectPage"
], function (JourneyRunner, BooksList, BooksObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('bookstorelistviewfjcm') + '/test/flpSandbox.html#bookstorelistviewfjcm-tile',
        pages: {
			onTheBooksList: BooksList,
			onTheBooksObjectPage: BooksObjectPage
        },
        async: true
    });

    return runner;
});

