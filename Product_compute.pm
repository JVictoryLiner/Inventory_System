# Child Of Product_access
package Product_compute;
use strict;
use warnings FATAL => 'all';

# Inherits Product_access
use parent "Product_access";

sub DESTROY {
    print("Product_edit::DESTROYED\n");
}

# Compute Function
sub compute {
    my %hash_var = @_;
    print(" " x 33, "\n");
    print("Total Inventory:\n");
    my $counter = 1;
    foreach my $key (keys %hash_var) {
        print($counter, ". ", $key, "\n");
        print("Total Quantity: ", $hash_var{$key}[0], "\n");
        print("Price Per Item: PHP", $hash_var{$key}[1], "\n");
        print("Warranty (Months): ", $hash_var{$key}[2], "\n");
        print("Total Restocks: ", $hash_var{$key}[3], "\n");
        print("Total Item Inventory Price: PHP", $hash_var{$key}[0] * $hash_var{$key}[1], "\n");
        print(" " x 33, "\n");
        $counter += 1;
    }
}

1;