# Parent Class
package Product_access;
use strict;
use warnings FATAL => 'all';

# Constructor
sub new {
    my ($class, $args) = @_;
    my $self = {
        prod_name     => $args->{prod_name} || "generic",
        prod_quantity => $args->{prod_quantity} || 0,
        prod_price    => $args->{prod_price} || 0,
        prod_warranty => $args->{prod_warranty} || 0,
        prod_restock  => $args->{prod_restock} || 0,
    };
    return bless $self, $class;
}

sub DESTROY {
    print("Product_access::DESTROYED");
}

# prod_name GETTER
sub get_prod_name {
    return $_[0]->{prod_name};
}

# prod_name SETTER
sub set_prod_name {
    my ($self, $new_value) = @_;
    $$self{prod_name} = $new_value;
    return $self;
}

# prod_quantity GETTER
sub get_prod_quantity {
    return $_[0]->{prod_quantity};
}

# prod_quantity SETTER
sub set_prod_quantity {
    my ($self, $new_value) = @_;
    $$self{prod_quantity} = $new_value;
    return $self;
}

# prod_warranty GETTER
sub get_prod_warranty {
    return $_[0]->{prod_warranty};
}

# prod_quantity SETTER
sub set_prod_warranty {
    my ($self, $new_value) = @_;
    $$self{prod_warranty} = $new_value;
    return $self;
}

# prod_price GETTER
sub get_prod_price {
    return $_[0]->{prod_price};
}

# prod_quantity SETTER
sub set_prod_price {
    my ($self, $new_value) = @_;
    $$self{prod_price} = $new_value;
    return $self;
}

# prod_restock GETTER
sub get_prod_restock {
    return $_[0]->{prod_restock};
}

# prod_restock SETTER
sub set_prod_restock {
    my ($self, $new_value) = @_;
    $$self{prod_restock} = $new_value;
    return $self;
}

# Converts Scalar (String) to Title Case
sub str_to_title {
    local $_ = shift;
    s/(\w+\S*\w*)/\u\L$1/g;
    return $_;
}

# Checks Scalar (String) if composed of Letters/Numbers/Both
sub check {
    my $str = shift;
    #if ($str =~ /^[a-zA-Z]+$/){
    #    return $str." all letters";
    #}
    if ($str =~ /^[0-9]+$/) {
        return 1; # All Numbers
    }
    else {
        return 2; # Mix Of Num and Letters
    }
}

1;