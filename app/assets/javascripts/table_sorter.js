
// Make sure we have a sortable table before we 
// setup the table (i.e. extract its rows and stuff)
window.onload = function() {
  sortableTable = $("table.sortable-table").get()[0];

  if (sortableTable != undefined) {
    setupTableFromElement(sortableTable);
  }
};

// The names of the style classes that even and odd rows
// (alternating of course) will take on.
var rowStyleClasses = {
  odd: "odd-row",
  even: "even-row"
};

// Stores the rows and headers from the table
//
var tableRowsAndHeaders = {
  rows: [],
  headers: [],
  asc_sort: false
};

// Whether we are doing an ascending sort or not
// (this is really just a toggle variable)
var sortType = {
  ascending: false
}

var buildRow = function(headerElements, rowCollection, rowElement) {
  var i,
      row = {};

  for (i = 0; i < headerElements.length; i+= 1) {
    if (headerElements[i].textContent) {
      row[headerElements[i].textContent] = rowCollection[i].textContent;
    }
  }
  row["row_elem"] = rowElement;
  return row;
};

var getTableHeaderNameList = function(elements) {
  var headerNames = [],
      i;

  for (i = 0; i < elements.length; i += 1) {
    headerNames.push(elements[i].textContent);
  }
  return headerNames;
};

var getTableHeaders = function() {
  return $("table.sortable-table th").get();
};

var setupTableFromElement = function(tableElement) {
  var headers,
      headersNames,
      rows,
      i;

  headers = getTableHeaders();
  headersNames = getTableHeaderNameList(headers);

  tableRowsAndHeaders.headers = headersNames;

  rows = $("table.sortable-table tr").get().slice(1);

  for (i = 0; i < rows.length; i += 1) {
    tableRowsAndHeaders.rows.push(buildRow(headers, rows[i].children, rows[i]));
  }

  rewriteTableWith(tableRowsAndHeaders.rows);
};

// Strips out any characters in a passed string
// that are not numeric. Returns a resultant string
var removeNonNumericChars = function(value) {
  var result = "",
      i;

  for (i = 0; i < value.length; i += 1) {
    if (!isNaN(value[i])) {
      result += value[i];
    }
  }

  return result;
};

// Does comparisons
var compareHelper = function(val1, val2, numeric) {
  if (numeric) {
    val1 = removeNonNumericChars(val1);
    val2 = removeNonNumericChars(val2);
    if (sortType.ascending) {
      return parseFloat(val1) <= parseFloat(val2);
    }

    return parseFloat(val1) >= parseFloat(val2);
  }

  if (sortType.ascending) {
    return val1 <= val2;
  }

  return val1 >= val2;
};

// Re-writes the table with the passed rows.
var rewriteTableWith = function(newOrder) {
  var rows = $("table.sortable-table tr").get().slice(1),
      i,
      table = $("table.sortable-table").get()[0];

  for (i = rows.length-1; i >= 0; i -= 1) {
    rows[i].parentNode.removeChild(rows[i]);
  }

  for (i = 0; i < newOrder.length; i += 1) {
    table.appendChild(newOrder[i]["row_elem"]);
    if (i % 2 == 0) {
      newOrder[i]["row_elem"].className = rowStyleClasses.odd;
    }
    else {
      newOrder[i]["row_elem"].className = rowStyleClasses.even;
    }
  }
};

// Takes in a header element to be sorted by. The second param, a
// boolean value, specifies whether the header's elements are 
// numeric (defaults to false).
var sortByHeaderElement = function(headerElement, numeric=false) {
  var toSort = tableRowsAndHeaders.rows,
      sortBy = headerElement.textContent,
      sorted,
      i,
      j;

  if (tableRowsAndHeaders.headers.indexOf(sortBy) !== -1) {
    for (i = 0; i < toSort.length; i += 1) {
      if (i == 0) {
        sorted = [toSort[i]];
      }
      else {
        for (j = 0; j < sorted.length; j += 1) {
          if (compareHelper(sorted[j][sortBy], toSort[i][sortBy], numeric)) {
            sorted.splice(j, 0, toSort[i]);
            break;
          }
        }
        if (j == sorted.length) {
          sorted.push(toSort[i])
        }
      }
    }
  }

  sortType.ascending = !sortType.ascending;

  rewriteTableWith(sorted)
};
