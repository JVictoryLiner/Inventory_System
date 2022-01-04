# Child Of Product_access
package Product_add;
use strict;
use warnings FATAL => 'all';

# Inherits Product_access
use parent "Product_access";

sub DESTROY {
    print("Product_add::DESTROYED\n");
}

# Add Name Function
sub add_name {
    my $flag_value = 1;
    my $current_item;
    while ($flag_value == 1) {
        print("Full Item Name: ");
        $current_item = <>;
        $current_item = Product_access::str_to_title($current_item);
        chomp($current_item);
        $flag_value = 0;
    }
    return $current_item;
}

# Add Quantity Function
sub add_quan {
    my $flag_value = 1;
    my $current_quan;
    while ($flag_value == 1) {
        print("Item Quantity (Piece): ");
        $current_quan = <>;
        if (Product_access::check($current_quan) == 1) {
            chomp($current_quan);
            $current_quan = int($current_quan);
            $flag_value = 0;
        }
        else {
            print("Error: Number can't have letters.\n");
            print(" " x 5, "\n");
        }
    }
    return $current_quan;
}

# Add Price Function
sub add_price {
    my $flag_value = 1;
    my $current_price;
    while ($flag_value == 1) {
        print("Price Per Item: ");
        $current_price = <>;
        if (Product_access::check($current_price) == 1) {
            chomp($current_price);
            $current_price = int($current_price);
            $flag_value = 0;
        }
        else {
            print("Error: Number can't have letters.\n");
            print(" " x 5, "\n");
        }
    }
    return $current_price;
}

# Add Warranty Function
sub add_warranty {
    my $flag_value = 1;
    my $current_warranty;
    while ($flag_value == 1) {
        print("Item Warranty (Months): ");
        $current_warranty = <>;
        if (Product_access::check($current_warranty) == 1) {
            chomp($current_warranty);
            $current_warranty = int($current_warranty);
            $flag_value = 0;
        }
        else {
            print("Error: Number can't have letters.\n");
            print(" " x 5, "\n");
        }
    }
    return $current_warranty;
}

1;