package App_access;
use strict;
use warnings FATAL => 'all';

# Constructor
sub new {
    my ($class, $args) = @_;
    my $self = {
        user_name     => $args->{user_name} || "user",
        pass_word     => $args->{pass_word} || "pass",
        login_attempt => $args->{login_attempt} || 3,
    };
    return bless $self, $class;
}

sub DESTROY {
    print("App_access::DESTROYED\n");
}

# user_name GETTER
sub get_user_name {
    return $_[0]->{user_name};
}

# user_name SETTER
sub set_user_name {
    my ($self, $new_value) = @_;
    $$self{user_name} = $new_value;
    return $self;
}

# pass_word GETTER
sub get_pass_word {
    return $_[0]->{pass_word};
}

# user_name SETTER
sub set_pass_word {
    my ($self, $new_value) = @_;
    $$self{pass_word} = $new_value;
    return $self;
}

# login_attempt GETTER
sub get_login_attempt {
    return $_[0]->{login_attempt};
}

# login_attempt SETTER
sub set_login_attempt {
    my ($self, $new_value) = @_;
    $$self{login_attempt} = $new_value;
    return $self;
}

1;