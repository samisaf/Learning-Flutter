const String checkerBoard =
    """<svg width="400" height="400" xmlns="http://www.w3.org/2000/svg">
  <rect width="400" height="400" fill="white" />
  <!-- Draw the black squares -->
  <g fill="black">
    <!-- Loop through 8 rows -->
    <!-- Each row alternates start position -->
    <!-- Even rows start at (0, y), odd rows start at (50, y) -->
    <!-- Each square is 50x50 -->
    <!-- Use nested loops or pre-calculate -->
    <!-- Manually placing 32 black squares -->
    <!-- Row 0 -->
    <rect x="0" y="0" width="50" height="50"/>
    <rect x="100" y="0" width="50" height="50"/>
    <rect x="200" y="0" width="50" height="50"/>
    <rect x="300" y="0" width="50" height="50"/>
    <!-- Row 1 -->
    <rect x="50" y="50" width="50" height="50"/>
    <rect x="150" y="50" width="50" height="50"/>
    <rect x="250" y="50" width="50" height="50"/>
    <rect x="350" y="50" width="50" height="50"/>
    <!-- Row 2 -->
    <rect x="0" y="100" width="50" height="50"/>
    <rect x="100" y="100" width="50" height="50"/>
    <rect x="200" y="100" width="50" height="50"/>
    <rect x="300" y="100" width="50" height="50"/>
    <!-- Row 3 -->
    <rect x="50" y="150" width="50" height="50"/>
    <rect x="150" y="150" width="50" height="50"/>
    <rect x="250" y="150" width="50" height="50"/>
    <rect x="350" y="150" width="50" height="50"/>
    <!-- Row 4 -->
    <rect x="0" y="200" width="50" height="50"/>
    <rect x="100" y="200" width="50" height="50"/>
    <rect x="200" y="200" width="50" height="50"/>
    <rect x="300" y="200" width="50" height="50"/>
    <!-- Row 5 -->
    <rect x="50" y="250" width="50" height="50"/>
    <rect x="150" y="250" width="50" height="50"/>
    <rect x="250" y="250" width="50" height="50"/>
    <rect x="350" y="250" width="50" height="50"/>
    <!-- Row 6 -->
    <rect x="0" y="300" width="50" height="50"/>
    <rect x="100" y="300" width="50" height="50"/>
    <rect x="200" y="300" width="50" height="50"/>
    <rect x="300" y="300" width="50" height="50"/>
    <!-- Row 7 -->
    <rect x="50" y="350" width="50" height="50"/>
    <rect x="150" y="350" width="50" height="50"/>
    <rect x="250" y="350" width="50" height="50"/>
    <rect x="350" y="350" width="50" height="50"/>
  </g>
</svg>
""";

const String backgammonBoardSquare =
    """<svg width="300" height="300" xmlns="http://www.w3.org/2000/svg">
  <!-- Background -->
  <rect width="300" height="300" fill="#d2b48c" />

  <!-- Triangles Left Side -->
  <g>
    <!-- Top row -->
    <polygon points="0,0 25,150 50,0" fill="#8b0000" />
    <polygon points="50,0 75,150 100,0" fill="#f5f5dc" />
    <polygon points="100,0 125,150 150,0" fill="#8b0000" />
    <polygon points="150,0 175,150 200,0" fill="#f5f5dc" />
    <polygon points="200,0 225,150 250,0" fill="#8b0000" />
    <polygon points="250,0 275,150 300,0" fill="#f5f5dc" />

    <!-- Bottom row -->
    <polygon points="0,300 25,150 50,300" fill="#f5f5dc" />
    <polygon points="50,300 75,150 100,300" fill="#8b0000" />
    <polygon points="100,300 125,150 150,300" fill="#f5f5dc" />
    <polygon points="150,300 175,150 200,300" fill="#8b0000" />
    <polygon points="200,300 225,150 250,300" fill="#f5f5dc" />
    <polygon points="250,300 275,150 300,300" fill="#8b0000" />
  </g>
</svg>""";

const String backgammonBoardPortrait =
    """<svg width="300" height="600" xmlns="http://www.w3.org/2000/svg">
  <!-- Background -->
  <rect width="300" height="600" fill="#d2b48c" />

  <!-- Triangles Left Side with central gap -->
  <g>
    <!-- Top row (stopping at 250) -->
    <polygon points="0,0 25,250 50,0" fill="#8b0000" />
    <polygon points="50,0 75,250 100,0" fill="#f5f5dc" />
    <polygon points="100,0 125,250 150,0" fill="#8b0000" />
    <polygon points="150,0 175,250 200,0" fill="#f5f5dc" />
    <polygon points="200,0 225,250 250,0" fill="#8b0000" />
    <polygon points="250,0 275,250 300,0" fill="#f5f5dc" />

    <!-- Bottom row (starting from 350) -->
    <polygon points="0,600 25,350 50,600" fill="#f5f5dc" />
    <polygon points="50,600 75,350 100,600" fill="#8b0000" />
    <polygon points="100,600 125,350 150,600" fill="#f5f5dc" />
    <polygon points="150,600 175,350 200,600" fill="#8b0000" />
    <polygon points="200,600 225,350 250,600" fill="#f5f5dc" />
    <polygon points="250,600 275,350 300,600" fill="#8b0000" />
  </g>
</svg>""";
