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

<div class="ranger">
    <form action="filter.php" method="GET">
        <div class="price-input">
            <div class="field">
                <span>Min</span>
                <input type="number" class="input-min" value="2500">
            </div>
            <div class="separator">-</div>
            <div class="field">
                <span>Max</span>
                <input type="number" class="input-max" value="7500">
            </div>
        </div>
        <div class="slider">
            <div class="progress"></div>
        </div>
        <div class="range-input">
            <input type="range" class="range-min" name="min_price" min="0" max="10000" value="2500" step="100">
            <input type="range" class="range-max" name="max_price" min="0" max="10000" value="7500" step="100">
        </div>
        <button class="filter-button" type="submit">Filter</button>

    </form>
</div>