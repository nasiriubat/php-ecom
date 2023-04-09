<form action="filter.php" method="GET">
    <label class="filter-label" for="min_price">Minimum Price:</label>
    <div class="filter-group">
        <output for="min_price" name="min_output">0</output>
        <input class="" type="range" name="min_price" id="min_price" value="0" min="0" max="5000" step="100" onmousemove="showMinValue()">
    </div>
    <label class="filter-label" for="max_price">Maximum Price:</label>
    <div class="filter-group">
        <output for="max_price" name="max_output">100</output>
        <input type="range" name="max_price" id="max_price" value="100" min="100" max="5000" step="100" onmousemove="showMaxValue()">
    </div>
    <button class="filter-button" type="submit">Filter</button>
</form>