CRAN Task View: Web Technologies and Services
---------------------------------------------

  ----------------- -------------------------------------------------------------------
  **Maintainer:**   Scott Chamberlain, Karthik Ram, Christopher Gandrud, Patrick Mair
  **Contact:**      scott at ropensci.org
  **Version:**      2013-11-05
  ----------------- -------------------------------------------------------------------

This task view contains information about using R to obtain and parse
data from the web. The base version of R does not ship with many tools
for interacting with the web. Thankfully, there are an increasingly
large number of tools for interacting with the web. A list of available
packages and functions is presented below, grouped by the type of
activity. If you have any comments or suggestions for additions or
improvements for this taskview, go to Github and [submit an
issue](https://github.com/ropensci/webservices/issues), or make some
changes and [submit a pull
request](https://github.com/ropensci/webservices/pulls). If you can't
contribute on Github, [send Scott an email](mailto:scott@ropensci.org).
If you have an issue with one of the packages discussed below, please
contact the maintainer of that package.

Tools for Working with the Web from R
-------------------------------------

**Parsing Data from the Web**

-   txt, csv, etc.: you can use `read.csv()` after acquiring the csv
    file from the web via e.g., `getURL()` from RCurl. `read.csv()`
    works with http but not https, i.e.: `read.csv("http://...")`, but
    not `read.csv("https://...")`.
-   The
    [repmis](http://cran.r-project.org/web/packages/repmis/index.html)
    package contains a `source_data()` command to load plain-text data
    from a URL (either http or https).
-   The package
    [XML](http://cran.r-project.org/web/packages/XML/index.html)
    contains functions for parsing XML and HTML, and supports xpath for
    searching XML (think regex for strings). A helpful function to read
    data from one or more HTML tables is `readHTMLTable()`.
-   [scrapeR](http://cran.r-project.org/web/packages/scrapeR/index.html)
    provides additional tools for scraping data from HTML and XML
    documents.
-   The [XML2R](https://github.com/cpsievert/XML2R) package (to be on
    CRAN soon) is a collection of convenient functions for coercing XML
    into data frames.
-   The [rjson](http://cran.r-project.org/web/packages/rjson/index.html)
    converts R object into Javascript object notation (JSON) objects and
    vice-versa.
-   An alternative to the
    [rjson](http://cran.r-project.org/web/packages/rjson/index.html) is
    [RJSONIO](http://cran.r-project.org/web/packages/RJSONIO/index.html)
    which also converts to and from data in JSON format (it is fast for
    parsing).
-   An alternative to the
    [XML](http://cran.r-project.org/web/packages/XML/index.html) package
    is
    [selectr](http://cran.r-project.org/web/packages/selectr/index.html),
    which parses CSS3 Selectors and translates them to XPath 1.0
    expressions.
-   Custom formats: Some web APIs provide custom data formats which are
    usually modified xml or json, and handled by
    [XML](http://cran.r-project.org/web/packages/XML/index.html) and
    [rjson](http://cran.r-project.org/web/packages/rjson/index.html) or
    [RJSONIO](http://cran.r-project.org/web/packages/RJSONIO/index.html),
    respectively.
-   An alternative to
    [XML](http://cran.r-project.org/web/packages/XML/index.html) is
    [selectr](http://sjp.co.nz/projects/selectr/), which parses CSS3
    Selectors and translates them to XPath 1.0 expressions.
    [XML](http://cran.r-project.org/web/packages/XML/index.html) package
    is often used for parsing xml and html, but
    [selectr](http://sjp.co.nz/projects/selectr/) translates CSS
    selectors to XPath, so can use the CSS selectors instead of XPath.
    The [selectorgadget browser extension](http://selectorgadget.com/)
    can be used to identify page elements.
-   The [RHTMLForms](http://www.omegahat.org/RHTMLForms/) allows to read
    HTML documents and obtain a description of each of the forms it
    contains, along with the different elements and hidden fields

**Curl/HTTP/FTP**

-   [RCurl](http://cran.r-project.org/web/packages/RCurl/index.html): A
    low level curl wrapper that allows one to compose general HTTP
    requests and provides convenient functions to fetch URIs, get/post
    forms, etc. and process the results returned by the Web server. This
    provides a great deal of control over the HTTP/FTP connection and
    the form of the request while providing a higher-level interface
    than is available just using R socket connections. It also provide
    tools for Web authentication.
-   [httr](http://cran.r-project.org/web/packages/httr/index.html): A
    light wrapper around
    [RCurl](http://cran.r-project.org/web/packages/RCurl/index.html)
    that makes many things easier, but still allows you to access the
    lower level functionality of
    [RCurl](http://cran.r-project.org/web/packages/RCurl/index.html). It
    has convenient http verbs: `GET()`, `POST()`, `PUT()`, `DELETE()`,
    `PATCH()`, `HEAD()`, `BROWSE()`. These wrap functions are more
    convenient to use, though less configurable than counterparts in
    [RCurl](http://cran.r-project.org/web/packages/RCurl/index.html).
    The equivalent of httr's `GET()` in
    [RCurl](http://cran.r-project.org/web/packages/RCurl/index.html) is
    `getForm()`. Likewise, the equivalent of
    [httr](http://cran.r-project.org/web/packages/httr/index.html) 's
    `POST()` in
    [RCurl](http://cran.r-project.org/web/packages/RCurl/index.html) is
    `postForm()`. http status codes are helpful for debugging http
    calls. This package makes this easier using, for example,
    `stop_for_status()` gets the http status code from a response
    object, and stops the function if the call was not successful. See
    also `warn_for_status()`. Note that you can pass in additional Curl
    options to the `config` parameter in http calls.
-   The [XMLRPC](http://www.omegahat.org/XMLRPC/) package provides an
    implementation of XML-RPC, a relatively simple remote procedure call
    mechanism that uses HTTP and XML. This can be used for communicating
    between processes on a single machine or for accessing Web services
    from within R.
-   [RTidyHTML](http://www.omegahat.org/RTidyHTML/) interfaces to the
    libtidy library for correcting HTML documents that are not
    well-formed. This library corrects common errors in HTML documents.

**Authentication**

-   Using web resources can require authentication, either via API keys,
    OAuth, username:password combination, or via other means.
    Additionally, sometimes web resources that require authentication be
    in the header of an http call, which requires a little bit of extra
    work. API keys and username:password combos can be combined within a
    url for a call to a web resource (api key:
    http://api.foo.org/?key=yourkey; user/pass:
    http://username:password@api.foo.org), or can be specified via
    commands in
    [RCurl](http://cran.r-project.org/web/packages/RCurl/index.html) or
    [httr](http://cran.r-project.org/web/packages/httr/index.html).
    OAuth is the most complicated authentication process, and can be
    most easily done using
    [httr](http://cran.r-project.org/web/packages/httr/index.html). See
    the 6 demos within
    [httr](http://cran.r-project.org/web/packages/httr/index.html),
    three for OAuth 1.0 (linkedin, twitter, vimeo) and three for OAuth
    2.0 (facebook, github, google).
    [ROAuth](http://cran.r-project.org/web/packages/ROAuth/index.html)
    is a package that provides a separate R interface to OAuth. OAuth is
    easier to to do in
    [httr](http://cran.r-project.org/web/packages/httr/index.html), so
    start there.

**Web Frameworks**

-   The [shiny](http://cran.r-project.org/web/packages/shiny/index.html)
    package makes it easy to build interactive web applications with R.
-   The [Rook](http://cran.r-project.org/web/packages/Rook/index.html)
    web server interface contains the specification and convenience
    software for building and running Rook applications.
-   The
    [opencpu](http://cran.r-project.org/web/packages/opencpu/index.html)
    framework for embedded statistical computation and reproducible
    research exposes a web API interfacing R, LaTeX and Pandoc. This API
    is used for example to integrate statistical functionality into
    systems, share and execute scripts or reports on centralized
    servers, and build R based apps. See also
    [opencpucran](http://cran.r-project.org/web/packages/opencpucran/index.html).
-   A package by Yihui Xie called
    [servr](http://cran.r-project.org/web/packages/servr/index.html)
    provides a simple HTTP server to serve files under a given directory
    based on the
    [httpuv](http://cran.r-project.org/web/packages/httpuv/index.html)
    package.
-   The
    [httpuv](http://cran.r-project.org/web/packages/httpuv/index.html)
    package, made by Joe Cheng at RStudio, provides low-level socket and
    protocol support for handling HTTP and WebSocket requests directly
    within R.
-   Plot.ly is a company that allows you to create visualizations in the
    web using R (and Python). They have an R package in development
    [here](https://github.com/cparmer/Plotly/tree/master/Ahttp://cran.r-project.org/web/packages/R),
    as well as access to their services via an API
    [here](https://plot.ly/API/).
-   The [WADL](http://www.omegahat.org/WADL/) package provides tools to
    process Web Application Description Language (WADL) documents and to
    programmatically generate R functions to interface to the REST
    methods described in those WADL documents.

**JavaScript**

-   [ggvis](https://github.com/rstudio/ggvis) (not on CRAN) makes it
    easy to describe interactive web graphics in R. It fuses the ideas
    of ggplot2 and
    [shiny](http://cran.r-project.org/web/packages/shiny/index.html),
    rendering graphics on the web with Vega.
-   [rCharts](https://github.com/ramnathv/rCharts) (not on CRAN) allows
    for interactive javascript charts from R.
-   [rVega](https://github.com/metagraf/rVega) (not on CRAN) is an R
    wrapper for Vega.
-   [clickme](https://github.com/nachocab/clickme) (not on CRAN) is an R
    package to create interactive plots.
-   [animint](https://github.com/tdhock/animint) (not on CRAN) allows an
    interactive animation to be defined using a list of ggplots with
    clickSelects and showSelected aesthetics, then exported to
    CSV/JSON/D3/JavaScript for viewing in a web browser.
-   The [SpiderMonkey](http://www.omegahat.org/SpiderMonkey/) package
    provides a means of evaluating JavaScript code, creating JavaScript
    objects and calling JavaScript functions and methods from within R.
    This can work by embedding the JavaScript engine within an R session
    or by embedding R in an browser such as Firefox and being able to
    call R from JavaScript and call back to JavaScript from R.

Data Sources on the Web Accessible via R
----------------------------------------

**Ecological and Evolutionary Biology**

-   [rvertnet](http://cran.r-project.org/web/packages/rvertnet/index.html):
    A wrapper to the VertNet collections database API.
-   [rgbif](http://cran.r-project.org/web/packages/rgbif/index.html):
    Interface to the Global Biodiversity Information Facility API
    methods.
-   [rfishbase](http://cran.r-project.org/web/packages/rfishbase/index.html):
    A programmatic interface to fishbase.org.
-   [treebase](http://cran.r-project.org/web/packages/treebase/index.html):
    An R package for discovery, access and manipulation of online
    phylogenies.
-   [taxize](http://cran.r-project.org/web/packages/taxize/index.html):
    Taxonomic information from around the web.
-   [dismo](http://cran.r-project.org/web/packages/dismo/index.html):
    Species distribution modeling, with wrappers to some APIs.
-   [rnbn](https://github.com/JNCC-UK/rnbn) (not on CRAN): Access to the
    UK National Biodiversity Network data.
-   [rWBclimate](https://github.com/ropensci/rWBclimate) (not on CRAN):
    R interface for the World Bank climate data.
-   [rbison](https://github.com/ropensci/rbison) (not on CRAN): Wrapper
    to the USGS Bison API.
-   [neotoma](https://github.com/ropensci/neotoma) (not on CRAN):
    Programmatic R interface to the Neotoma Paleoecological Database.
-   [rnoaa](https://github.com/ropensci/rnoaa) (not on CRAN): R
    interface to NOAA Climate data API.
-   [rnpn](https://github.com/ropensci/rnpn) (not on CRAN): Wrapper to
    the National Phenology Network database API.
-   [rfisheries](http://cran.r-project.org/web/packages/rfisheries/index.html):
    Package for interacting with fisheries databases at
    openfisheries.org.
-   [rebird](http://cran.r-project.org/web/packages/rebird/index.html):
    A programmatic interface to the eBird database.
-   [flora](http://cran.r-project.org/web/packages/flora/index.html):
    Retrieve taxonomical information of botanical names from the Flora
    do Brasil website.
-   [Rcolombos](http://cran.r-project.org/web/packages/Rcolombos/index.html):
    This package provides programmatic access to Colombos, a web based
    interface for exploring and analyzing comprehensive
    organism-specific cross-platform expression compendia of bacterial
    organisms.
-   [Reol](http://cran.r-project.org/web/packages/Reol/index.html): An R
    interface to the Encyclopedia of Life (EOL) API. Includes functions
    for downloading and extracting information off the EOL pages.
-   [rPlant](http://cran.r-project.org/web/packages/rPlant/index.html):
    An R interface to the the many computational resources iPlant offers
    through their RESTful application programming interface. Currently,
    [rPlant](http://cran.r-project.org/web/packages/rPlant/index.html)
    functions interact with the iPlant foundational API, the Taxonomic
    Name Resolution Service API, and the Phylotastic Taxosaurus API.
    Before using rPlant, users will have to register with the iPlant
    Collaborative.
    [http://www.iplantcollaborative.org/discover/discovery-environment](http://www.iplantcollaborative.org/discover/discovery-environment)

**Genes and Genomes**

-   [cgdsr](http://cran.r-project.org/web/packages/cgdsr/index.html):
    R-Based API for accessing the MSKCC Cancer Genomics Data Server
    (CGDS).
-   [rsnps](https://github.com/ropensci/rsnps) (not on CRAN): Wrapper to
    the openSNP data API and the Broad Institute SNP Annotation and
    Proxy Search.
-   [rentrez](http://cran.r-project.org/web/packages/rentrez/index.html):
    Talk with NCBI entrez using R.
-   [seqinr](http://cran.r-project.org/web/packages/seqinr/index.html):
    Exploratory data analysis and data visualization for biological
    sequence (DNA and protein) data.
-   [seq2R](http://cran.r-project.org/web/packages/seq2R/index.html):
    Detect compositional changes in genomic sequences - with some
    interaction with GenBank.

**Earth Science**

-   [RNCEP](http://cran.r-project.org/web/packages/RNCEP/index.html):
    Obtain, organize, and visualize NCEP weather data.
-   [crn](http://cran.r-project.org/web/packages/crn/index.html):
    Provides the core functions required to download and format data
    from the Climate Reference Network. Both daily and hourly data are
    downloaded from the ftp, a consolidated file of all stations is
    created, station metadata is extracted. In addition functions for
    selecting individual variables and creating R friendly datasets for
    them is provided.
-   [BerkeleyEarth](http://cran.r-project.org/web/packages/BerkeleyEarth/index.html):
    Data input for Berkeley Earth Surface Temperature.
-   [waterData](http://cran.r-project.org/web/packages/waterData/index.html):
    An R Package for retrieval, analysis, and anomaly calculation of
    daily hydrologic time series data.
-   [CHCN](http://cran.r-project.org/web/packages/CHCN/index.html): A
    compilation of historical through contemporary climate measurements
    scraped from the Environment Canada Website Including tools for
    scraping data, creating metadata and formating temperature files.
-   [decctools](http://cran.r-project.org/web/packages/decctools/index.html):
    Provides functions for retrieving energy statistics from the United
    Kingdom Department of Energy and Climate Change and related data
    sources. The current version focuses on total final energy
    consumption statistics at the local authority, MSOA, and LSOA
    geographies. Methods for calculating the generation mix of grid
    electricity and its associated carbon intensity are also provided.
-   [Metadata](http://cran.r-project.org/web/packages/Metadata/index.html):
    Collates metadata for climate surface stations.
-   [sos4R](http://cran.r-project.org/web/packages/sos4R/index.html): A
    client for Sensor Observation Services (SOS) as specified by the
    Open Geospatial Consortium (OGC). It allows users to retrieve
    metadata from SOS web services and to interactively create requests
    for near real-time observation data based on the available sensors,
    phenomena, observations et cetera using thematic, temporal and
    spatial filtering.

**Economics and Business**

-   [WDI](http://cran.r-project.org/web/packages/WDI/index.html):
    Search, extract and format data from the World Bank's World
    Development Indicators.
-   [FAOSTAT](http://cran.r-project.org/web/packages/FAOSTAT/index.html):
    The package hosts a list of functions to download, manipulate,
    construct and aggregate agricultural statistics provided by the
    FAOSTAT (Food and Agricultural Organization of the United Nations)
    database.
-   The [Zillow](http://www.omegahat.org/Zillow/) package provides an R
    interface to the Zillow Web Service API. It allows one to get the
    Zillow estimate for the price of a particular property specified by
    street address and ZIP code (or city and state), to find information
    (e.g. size of property and lot, number of bedrooms and bathrooms,
    year built.) about a given property, and to get comparable
    properties.

**Finance**

-   [RDatastream](https://github.com/fcocquemas/rdatastream) (not on
    CRAN): An R interface to the [Thomson Dataworks Enterprise SOAP
    API](http://dataworks.thomson.com/Dataworks/Enterprise/1.0/) (paid),
    with some convenience functions for retrieving Datastream data
    specifically.
-   [quantmod](http://cran.r-project.org/web/packages/quantmod/index.html):
    Specify, build, trade, and analyse quantitative financial trading
    strategies
-   [TFX](http://cran.r-project.org/web/packages/TFX/index.html):
    Connects to TrueFX(tm) for free streaming real-time and historical
    tick-by-tick market data for dealable interbank foreign exchange
    rates with millisecond detail.
-   [fImport](http://cran.r-project.org/web/packages/fImport/index.html):
    Environment for teaching "Financial Engineering and Computational
    Finance"

**Chemistry**

-   [rpubchem](http://cran.r-project.org/web/packages/rpubchem/index.html):
    Interface to the PubChem Collection.

**Agriculture**

-   [cimis](http://cran.r-project.org/web/packages/cimis/index.html): R
    package for retrieving data from CIMIS, the California Irrigation
    Management Information System.

**Literature, Metadata, Text, and Altmetrics**

-   [rplos](http://cran.r-project.org/web/packages/rplos/index.html): A
    programmatic interface to the Web Service methods provided by the
    Public Library of Science journals for search.
-   [rbhl](https://github.com/ropensci/rbhl) (not on CRAN): R interface
    to the Biodiversity Heritage Library (BHL) API.
-   [rmetadata](https://github.com/ropensci/rmetadata) (not on CRAN):
    Get scholarly metadata from around the web.
-   [RMendeley](http://cran.r-project.org/web/packages/RMendeley/index.html):
    Implementation of the Mendeley API in R.
-   [rentrez](http://cran.r-project.org/web/packages/rentrez/index.html):
    Talk with NCBI entrez using R.
-   [rorcid](https://github.com/ropensci/rorcid) (not on CRAN): A
    programmatic interface the Orcid.org API.
-   [rpubmed](https://github.com/ropensci/rpubmed) (not on CRAN): Tools
    for extracting and processing Pubmed and Pubmed Central records.
-   [rAltmetic](https://github.com/ropensci/rAltmetric) (not on CRAN):
    Query and visualize metrics from Altmetric.com.
-   [alm](https://github.com/ropensci/alm) (not on CRAN): R wrapper to
    the almetrics API platform developed by PLoS.
-   [ngramr](http://cran.r-project.org/web/packages/ngramr/index.html):
    Retrieve and plot word frequencies through time from the Google
    Ngram Viewer.
-   [scholar](http://cran.r-project.org/web/packages/scholar/index.html)
    provides functions to extract citation data from Google Scholar.
    Convenience functions are also provided for comparing multiple
    scholars and predicting future h-index values.

**Marketing**

-   [anametrix](http://cran.r-project.org/web/packages/anametrix/index.html):
    Bidirectional connector to Anametrix API.

**Data Depots**

-   [dvn](http://cran.r-project.org/web/packages/dvn/index.html):
    Provides access to The Dataverse Network API.
-   [rfigshare](http://cran.r-project.org/web/packages/rfigshare/index.html):
    Programmatic interface for Figshare.
-   [factualR](http://cran.r-project.org/web/packages/factualR/index.html):
    Thin wrapper for the Factual.com server API.
-   [dataone](http://cran.r-project.org/web/packages/dataone/index.html):
    A package that provides read/write access to data and metadata from
    the DataONE network of Member Node data repositories.
-   [yhatr](http://cran.r-project.org/web/packages/yhatr/index.html):
    Lets you deploy, maintain, and invoke models via the Yhat REST API.
-   [RSocrata](http://cran.r-project.org/web/packages/RSocrata/index.html):
    Provided with a Socrata dataset resource URL, or a Socrata SoDA web
    API query, returns an R data frame. Converts dates to POSIX format.
    Supports CSV and JSON. Manages throttling by Socrata.
-   [OAIHarvester](http://cran.r-project.org/web/packages/OAIHarvester/index.html):
    Harvest metadata using the Open Archives Initiative Protocol for
    Metadata Harvesting (OAI-PMH).
-   [Quandl](http://cran.r-project.org/web/packages/Quandl/index.html):
    A package that interacts directly with the
    [Quandl](http://www.quandl.com/) API to offer data in a number of
    formats usable in R, as well as the ability to upload and search.

**Machine Learning as a Service**

-   [bigml](http://cran.r-project.org/web/packages/bigml/index.html):
    BigML, a machine learning web service.
-   [MTurkR](http://cran.r-project.org/web/packages/MTurkR/index.html):
    Access to Amazon Mechanical Turk Requester API via R.

**Web Analytics**

-   [rgauges](https://github.com/ropensci/rgauges) (not on CRAN):
    Interface to Gaug.es API.
-   [RSiteCatalyst](http://cran.r-project.org/web/packages/RSiteCatalyst/index.html):
    Functions for accessing the Adobe Analytics (Omniture SiteCatalyst)
    Reporting API.
-   [r-google-analytics](http://code.google.com/p/r-google-analytics/)
    (not on CRAN): Provides access to Google Analytics.
-   [RGoogleTrends](http://www.omegahat.org/RGoogleTrends/) provides
    programmatic access to Google Trends data. This is information about
    the popularity of a particular query.

**News**

-   [GuardianR](http://cran.r-project.org/web/packages/GuardianR/index.html):
    Provides an interface to the Open Platform's Content API of the
    Guardian Media Group. It retrieves content from news outlets The
    Observer, The Guardian, and guardian.co.uk from 1999 to current day.
-   [RNYTimes](http://www.omegahat.org/RNYTimes) provides interfaces to
    several of the New York Times Web services for searching articles,
    meta-data, user-generated content and best seller lists.

**Images, Videos, Music**

-   [imguR](http://cran.r-project.org/web/packages/imguR/index.html): A
    package to share plots using the image hosting service imgur.com.
-   [RLastFM](http://cran.r-project.org/web/packages/RLastFM/index.html):
    A package to interface to the last.fm API.

**Sports**

-   [nhlscrapr](http://cran.r-project.org/web/packages/nhlscrapr/index.html):
    Compiling the NHL Real Time Scoring System Database for easy use in
    R.
-   [pitchRx](http://cran.r-project.org/web/packages/pitchRx/index.html):
    Tools for Collecting and Visualizing Major League Baseball PITCHfx
    Data

**Maps**

-   [RgoogleMaps](http://cran.r-project.org/web/packages/RgoogleMaps/index.html):
    This package serves two purposes: It provides a comfortable R
    interface to query the Google server for static maps, and use the
    map as a background image to overlay plots within R.
-   [osmar](http://cran.r-project.org/web/packages/osmar/index.html):
    This package provides infrastructure to access OpenStreetMap data
    from different sources to work with the data in common R manner and
    to convert data into available infrastructure provided by existing R
    packages (e.g., into sp and igraph objects).
-   [ggmap](http://cran.r-project.org/web/packages/ggmap/index.html):
    Allows for the easy visualization of spatial data and models on top
    of Google Maps, OpenStreetMaps, Stamen Maps, or CloudMade Maps using
    ggplot2.
-   The [GeoIP](http://www.omegahat.org/GeoIP/) package maps IP
    addresses and host names to geographic locations - latitude,
    longitude, region, city, zip code, etc.
-   The [RKML](http://www.omegahat.org/RKML/) is an implementation that
    provides users with high-level facilities to generate KML, the
    Keyhole Markup Language for display in, e.g., Google Earth.
-   [RKMLDevice](http://www.omegahat.org/RKMLDevice/) allows to create R
    graphics in KML format in a manner that allows them to be displayed
    on Google Earth (or Google Maps).

**Social media**

-   [streamR](http://cran.r-project.org/web/packages/streamR/index.html):
    This package provides a series of functions that allow R users to
    access Twitter's filter, sample, and user streams, and to parse the
    output into data frames. OAuth authentication is supported.
-   [twitteR](http://cran.r-project.org/web/packages/twitteR/index.html):
    Provides an interface to the Twitter web API.
-   The [Rflickr](http://www.omegahat.org/Rflickr) package provides an R
    interface to the Flickr photo management and sharing application Web
    service.

**Government**

-   [wethepeople](http://cran.r-project.org/web/packages/wethepeople/index.html):
    An R client for interacting with the White House's "We The People"
    petition API.
-   [govdat](http://cran.r-project.org/web/packages/govdat/index.html):
    Interface to various APIs for government data, including New York
    Times congress API, and the Sunlight Foundation set of APIs.
-   [govStatJPN](http://cran.r-project.org/web/packages/govStatJPN/index.html):
    Functions to get public survey data in Japan.

**Google Web Services**

-   [RGoogleStorage](http://www.omegahat.org/RGoogleStorage/) provides
    programmatic access to the Google Storage API. This allows R users
    to access and store data on Google's storage. We can upload and
    download content, create, list and delete folders/buckets, and set
    access control permissions on objects and buckets.
-   The [RGoogleDocs](http://www.omegahat.org/RGoogleDocs/) package is
    an example of using the RCurl and XML packages to quickly develop an
    interface to the Google Documents API.

**Amazon Web Services**

-   [AWS.tools](http://cran.r-project.org/web/packages/AWS.tools/index.html):
    An R package to interact with Amazon Web Services (EC2/S3).
-   [RAmazonS3](http://www.omegahat.org/RAmazonS3) package provides the
    basic infrastructure within R for communicating with the S3 Amazon
    storage server. This is a commercial server that allows one to store
    content and retrieve it from any machine connected to the Internet.
-   [RAmazonDBREST](http://www.omegahat.org/RAmazonDBREST) provides an
    interface to Amazon's Simple DB API.
-   [MTurkR](http://cran.r-project.org/web/packages/MTurkR/index.html):
    Access to Amazon Mechanical Turk Requester API via R.

**Other**

-   [sos4R](http://cran.r-project.org/web/packages/sos4R/index.html): R
    client for the OGC Sensor Observation Service.
-   [datamart](http://cran.r-project.org/web/packages/datamart/index.html):
    Provides an S4 infrastructure for unified handling of internal
    datasets and web based data sources. Examples include dbpedia,
    eurostat and sourceforge.
-   [rDrop](https://github.com/karthikram/rDrop) (not on CRAN): Dropbox
    interface.
-   [zendeskR](http://cran.r-project.org/web/packages/zendeskR/index.html):
    This package provides an R wrapper for the Zendesk API.
-   [AWS.tools](http://cran.r-project.org/web/packages/AWS.tools/index.html):
    An R package to interact with Amazon Web Services (EC2/S3).

### CRAN packages:

-   [anametrix](http://cran.r-project.org/web/packages/anametrix/index.html)
-   [AWS.tools](http://cran.r-project.org/web/packages/AWS.tools/index.html)
-   [BerkeleyEarth](http://cran.r-project.org/web/packages/BerkeleyEarth/index.html)
-   [bigml](http://cran.r-project.org/web/packages/bigml/index.html)
-   [cgdsr](http://cran.r-project.org/web/packages/cgdsr/index.html)
-   [CHCN](http://cran.r-project.org/web/packages/CHCN/index.html)
-   [cimis](http://cran.r-project.org/web/packages/cimis/index.html)
-   [crn](http://cran.r-project.org/web/packages/crn/index.html)
-   [datamart](http://cran.r-project.org/web/packages/datamart/index.html)
-   [dataone](http://cran.r-project.org/web/packages/dataone/index.html)
-   [decctools](http://cran.r-project.org/web/packages/decctools/index.html)
-   [dismo](http://cran.r-project.org/web/packages/dismo/index.html)
-   [dvn](http://cran.r-project.org/web/packages/dvn/index.html)
-   [factualR](http://cran.r-project.org/web/packages/factualR/index.html)
-   [FAOSTAT](http://cran.r-project.org/web/packages/FAOSTAT/index.html)
-   [fImport](http://cran.r-project.org/web/packages/fImport/index.html)
-   [flora](http://cran.r-project.org/web/packages/flora/index.html)
-   [ggmap](http://cran.r-project.org/web/packages/ggmap/index.html)
-   [googlePublicData](http://cran.r-project.org/web/packages/googlePublicData/index.html)
-   [govdat](http://cran.r-project.org/web/packages/govdat/index.html)
-   [govStatJPN](http://cran.r-project.org/web/packages/govStatJPN/index.html)
-   [GuardianR](http://cran.r-project.org/web/packages/GuardianR/index.html)
-   [httpuv](http://cran.r-project.org/web/packages/httpuv/index.html)
-   [httr](http://cran.r-project.org/web/packages/httr/index.html)
    (core)
-   [imguR](http://cran.r-project.org/web/packages/imguR/index.html)
-   [Metadata](http://cran.r-project.org/web/packages/Metadata/index.html)
-   [MTurkR](http://cran.r-project.org/web/packages/MTurkR/index.html)
-   [NCBI2R](http://cran.r-project.org/web/packages/NCBI2R/index.html)
-   [ngramr](http://cran.r-project.org/web/packages/ngramr/index.html)
-   [nhlscrapr](http://cran.r-project.org/web/packages/nhlscrapr/index.html)
-   [OAIHarvester](http://cran.r-project.org/web/packages/OAIHarvester/index.html)
-   [opencpu](http://cran.r-project.org/web/packages/opencpu/index.html)
-   [osmar](http://cran.r-project.org/web/packages/osmar/index.html)
-   [pitchRx](http://cran.r-project.org/web/packages/pitchRx/index.html)
-   [quantmod](http://cran.r-project.org/web/packages/quantmod/index.html)
-   [Rcolombos](http://cran.r-project.org/web/packages/Rcolombos/index.html)
-   [RCurl](http://cran.r-project.org/web/packages/RCurl/index.html)
    (core)
-   [rdatamarket](http://cran.r-project.org/web/packages/rdatamarket/index.html)
-   [rebird](http://cran.r-project.org/web/packages/rebird/index.html)
-   [rentrez](http://cran.r-project.org/web/packages/rentrez/index.html)
-   [Reol](http://cran.r-project.org/web/packages/Reol/index.html)
-   [repmis](http://cran.r-project.org/web/packages/repmis/index.html)
-   [rfigshare](http://cran.r-project.org/web/packages/rfigshare/index.html)
-   [rfishbase](http://cran.r-project.org/web/packages/rfishbase/index.html)
-   [rfisheries](http://cran.r-project.org/web/packages/rfisheries/index.html)
-   [rgbif](http://cran.r-project.org/web/packages/rgbif/index.html)
-   [RgoogleMaps](http://cran.r-project.org/web/packages/RgoogleMaps/index.html)
-   [rjson](http://cran.r-project.org/web/packages/rjson/index.html)
    (core)
-   [RJSONIO](http://cran.r-project.org/web/packages/RJSONIO/index.html)
    (core)
-   [RLastFM](http://cran.r-project.org/web/packages/RLastFM/index.html)
-   [RMendeley](http://cran.r-project.org/web/packages/RMendeley/index.html)
-   [RNCBI](http://cran.r-project.org/web/packages/RNCBI/index.html)
-   [RNCEP](http://cran.r-project.org/web/packages/RNCEP/index.html)
-   [ROAuth](http://cran.r-project.org/web/packages/ROAuth/index.html)
-   [Rook](http://cran.r-project.org/web/packages/Rook/index.html)
-   [rPlant](http://cran.r-project.org/web/packages/rPlant/index.html)
-   [rplos](http://cran.r-project.org/web/packages/rplos/index.html)
-   [rpubchem](http://cran.r-project.org/web/packages/rpubchem/index.html)
-   [RSiteCatalyst](http://cran.r-project.org/web/packages/RSiteCatalyst/index.html)
-   [RSocrata](http://cran.r-project.org/web/packages/RSocrata/index.html)
-   [RTDAmeritrade](http://cran.r-project.org/web/packages/RTDAmeritrade/index.html)
-   [rvertnet](http://cran.r-project.org/web/packages/rvertnet/index.html)
-   [RWeather](http://cran.r-project.org/web/packages/RWeather/index.html)
-   [scholar](http://cran.r-project.org/web/packages/scholar/index.html)
-   [scrapeR](http://cran.r-project.org/web/packages/scrapeR/index.html)
-   [selectr](http://cran.r-project.org/web/packages/selectr/index.html)
-   [servr](http://cran.r-project.org/web/packages/servr/index.html)
-   [shiny](http://cran.r-project.org/web/packages/shiny/index.html)
    (core)
-   [sos4R](http://cran.r-project.org/web/packages/sos4R/index.html)
-   [streamR](http://cran.r-project.org/web/packages/streamR/index.html)
-   [SynergizeR](http://cran.r-project.org/web/packages/SynergizeR/index.html)
-   [taxize](http://cran.r-project.org/web/packages/taxize/index.html)
-   [TFX](http://cran.r-project.org/web/packages/TFX/index.html)
-   [treebase](http://cran.r-project.org/web/packages/treebase/index.html)
-   [twitteR](http://cran.r-project.org/web/packages/twitteR/index.html)
-   [waterData](http://cran.r-project.org/web/packages/waterData/index.html)
-   [WDI](http://cran.r-project.org/web/packages/WDI/index.html)
-   [wethepeople](http://cran.r-project.org/web/packages/wethepeople/index.html)
-   [XML](http://cran.r-project.org/web/packages/XML/index.html) (core)
-   [yhatr](http://cran.r-project.org/web/packages/yhatr/index.html)
-   [zendeskR](http://cran.r-project.org/web/packages/zendeskR/index.html)

### Related links:

-   [GitHub package: alm](https://github.com/ropensci/alm)
-   [GitHub package: animint](https://github.com/tdhock/animint)
-   [GitHub package: clickme](https://github.com/nachocab/clickme)
-   [Omegahat package: GeoIP](http://www.omegahat.org/GeoIP/)
-   [GitHub package: ggvis](https://github.com/rstudio/ggvis)
-   [GitHub package: neotoma](https://github.com/ropensci/neotoma)
-   [GitHub package: rAltmetic](https://github.com/ropensci/rAltmetric)
-   [Omegahat package:
    RAmazonDBREST](http://www.omegahat.org/RAmazonDBREST)
-   [Omegahat package: RAmazonS3](http://www.omegahat.org/RAmazonS3)
-   [GitHub package: rbhl](https://github.com/ropensci/rbhl)
-   [GitHub package: rbison](https://github.com/ropensci/rbison)
-   [GitHub package: rCharts](https://github.com/ramnathv/rCharts)
-   [GitHub package: rDrop](https://github.com/karthikram/rDrop)
-   [Omegahat package: REuPathDB](http://www.omegahat.org/REuPathDB/)
-   [Omegahat package: Rflickr](http://www.omegahat.org/Rflickr)
-   [GitHub package: rgauges](https://github.com/ropensci/rgauges)
-   [Omegahat package:
    RGoogleDocs](http://www.omegahat.org/RGoogleDocs/)
-   [Omegahat package:
    RGoogleStorage](http://www.omegahat.org/RGoogleStorage/)
-   [Omegahat package:
    RGoogleTrends](http://www.omegahat.org/RGoogleTrends/)
-   [Omegahat package: RHTMLForms](http://www.omegahat.org/RHTMLForms/)
-   [Omegahat package: RKML](http://www.omegahat.org/RKML/)
-   [Omegahat package: RKMLDevice](http://www.omegahat.org/RKMLDevice/)
-   [GitHub package: rmetadata](https://github.com/ropensci/rmetadata)
-   [GitHub package: rnbn](https://github.com/JNCC-UK/rnbn)
-   [GitHub package: rnoaa](https://github.com/ropensci/rnoaa)
-   [GitHub package: rnpn](https://github.com/ropensci/rnpn)
-   [Omegahat package: RNYTimes](http://www.omegahat.org/RNYTimes)
-   [GitHub package: rorcid](https://github.com/ropensci/rorcid)
-   [GitHub package: rpubmed](https://github.com/ropensci/rpubmed)
-   [GitHub package: rsnps](https://github.com/ropensci/rsnps)
-   [Omegahat package: RTidyHTML](http://www.omegahat.org/RTidyHTML/)
-   [GitHub package: rVega](https://github.com/metagraf/rVega)
-   [GitHub package: rWBclimate](https://github.com/ropensci/rWBclimate)
-   [Omegahat package:
    SpiderMonkey](http://www.omegahat.org/SpiderMonkey/)
-   [GitHub package: XML2R](https://github.com/cpsievert/XML2R)
-   [Omegahat package: XMLRPC](http://www.omegahat.org/XMLRPC/)
-   [Omegahat package: WADL](http://www.omegahat.org/WADL/)
-   [Omegahat package: Zillow](http://www.omegahat.org/Zillow/)
-   [GitHub package:
    RDatastream](https://github.com/fcocquemas/rdatastream)

