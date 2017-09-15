// This is the text editor interface.
// Anything you type or change here will be seen by the other person in real time.

// - They all have the same number or have three different numbers..
// - They all have the same shape or have three different shapes.
// - They all have the same fill or have three different fills.
// - They all have the same color or have three different colors.
// https://mrrgteacher.files.wordpress.com/2011/12/sets_examples1-1024x586.png

// different properties a card can have


properties ={
    shape: ['Pill', 'Diamond', 'Squiggle'],
    number: [1, 2, 3],
    color: ['Red', 'Green', 'Purple'],
    fill: ['Solid', 'Open', 'Hatch'],
};

// example of a card instance
card = {
    shape: 'Pill',
    number: 2,
    color: 'Purple',
    fill: 'Solid',
};

card7 = {
    shape: 'Pill',
    number: 2,
    color: 'Green',
    fill: 'Solid',
};
card8 = {
    shape: 'Diamond',
    number: 1,
    color: 'Green',
    fill: 'Hatch',
};
card9 = {
    shape: 'Squiggle',
    number: 2,
    color: 'Green',
    fill: 'Solid',
};

// card = ["Pill", 2, 'Purple', 'Solid']

var is_set = function(cards){
    return (checkProperty(cards, 'shape') && checkProperty(cards, 'number') && checkProperty(cards, 'color') && checkProperty(cards, 'fill'))
};

function checkProperty(cards, property) {
    var length = cards.length
    var nums = {};

    cards.forEach( function(card) {
        let val = card[property];
        nums[val] ? nums[val] ++ : nums[val] = 1;
    })

    var count = 0;

    for (key in nums)  {
        if (nums[key] === 3) {
            return true;
        } else if (nums[key] === 1) {
            count ++;
        }
    }

    return count === 3
}



// valid
// ['Pill', 3, 'Red', 'Solid']
// ['Diamond', 2, 'Green', 'Hatch']
// ['Squiggle', 1, 'Purple', 'Open']
card1 = {
    shape: 'Pill',
    number: 3,
    color: 'Red',
    fill: 'Solid',
};
card2 = {
    shape: 'Diamond',
    number: 2,
    color: 'Green',
    fill: 'Hatch',
};
card3 = {
    shape: 'Squiggle',
    number: 1,
    color: 'Purple',
    fill: 'Open',
};


// valid
// ['Pill', 2, 'Green', 'Open']
// ['Diamond', 2, 'Green', 'Hatch']
// ['Squiggle', 2, 'Green', 'Solid']
card4 = {
    shape: 'Pill',
    number: 2,
    color: 'Green',
    fill: 'Open',
};
card5 = {
    shape: 'Diamond',
    number: 2,
    color: 'Green',
    fill: 'Hatch',
};
card6 = {
    shape: 'Squiggle',
    number: 2,
    color: 'Green',
    fill: 'Solid',
};


// not valid
// ['Pill', 2, 'Green', 'Solid']
// ['Diamond', 2, 'Green', 'Hatch']
// ['Squiggle', 2, 'Green', 'Solid']
card7 = {
    shape: 'Pill',
    number: 2,
    color: 'Green',
    fill: 'Solid',
};
card8 = {
    shape: 'Diamond',
    number: 2,
    color: 'Green',
    fill: 'Hatch',
};
card9 = {
    shape: 'Squiggle',
    number: 2,
    color: 'Green',
    fill: 'Solid',
};

console.log(is_set([card1, card2, card3]), true);
console.log(is_set([card4, card5, card6]), true);
console.log(is_set([card7, card8, card9]), false);
