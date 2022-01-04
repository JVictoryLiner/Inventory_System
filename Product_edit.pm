# Child Of Product_access
package Product_edit;
use strict;
use warnings FATAL => 'all';

# Inherits Product_access
use parent "Product_access";

sub DESTROY {
    print("Product_edit::DESTROYED\n");
}
# Edit Quantity Function
sub edit_quan {
    my $flag_value = 1;
    my $current_quan;
    while($flag_value == 1) {
        print("Item Quantity (Pcs.): ");
        $current_quan = <>;
        if(Product_access::check($current_quan) == 1) {
            chomp($current_quan);
            $current_quan = int($current_quan);
            $flag_value = 0;
        }else {
            print("Error: Number can't have letters.\n");
            print(" " x 5, "\n");
        }

    }
    return $current_quan;
}

# Edit Price Function
sub edit_price {
    my $flag_value = 1;
    my $current_price;
    while($flag_value == 1) {
        print("Price Per Item: ");
        $current_price = <>;
        if(Product_access::check($current_price) == 1) {
            chomp($current_price);
            $current_price = int($current_price);
            $flag_value = 0;
        }else {
            print("Error: Number can't have letters.\n");
            print(" " x 5, "\n");
        }
    }
    return $current_price;
}

# Edit Warranty Function
sub edit_warranty {
    my $flag_value = 1;
    my $current_warranty;
    while($flag_value == 1) {
        print("Item Warranty (Months): ");
        $current_warranty = <>;
        if(Product_access::check($current_warranty) == 1) {
            chomp($current_warranty);
            $current_warranty = int($current_warranty);
            $flag_value = 0;
        }else {
            print("Error: Number can't have letters.\n");
            print(" " x 5, "\n");
        }
    }
    return $current_warranty;
}

1;