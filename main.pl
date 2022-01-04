#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use feature qw/say/;
no warnings 'redefine';

# ALT CODE FOR PERL
# ╔ - chr(201) / ╗ - chr(187) / ═ - chr(205) / ║ - chr(186) / ╠ - chr(204) / Θ - chr(233)
# ╣ - chr(185) / ╚ - chr(200) / ╝ - chr(188) / ╦ - chr(203) / ╩ - chr(202) / ▀ - chr(223)

# Call Perl Packages
use App_access;     # Parent Class (No Children)
use Product_access; # Parent Class
use Product_add;    # Child Class of Product_access
use Product_edit;   # Child Class of Product_access
use Product_compute;# Child Class of Product_access

# Global Variables
# Initialize Children Classes
my $prod_add;
my $prod_edit;
my $prod_compute;
# Initialize Dictionaries
my %general_credentials = ();
my %important_credentials = ("lou" => [ 10000, "a", "wed" ]); # ("User" => [Credit, Email, Password])
my %product_dict = (); # ("Product" => [Quantity, Price, Warranty, Restock])
my %order_dict = (); # ("User" => [Product, Quantity, Price, Warranty])

# Print Functions
sub mobile_body {
    # Prints Header
    sub display_header {
        print(chr(201), chr(205) x 31, chr(187), "\n");
        print(chr(186), "12:00 NN", " " x 7, chr(233), " " x 11, chr(223), "50%", chr(186), "\n");
        print(chr(204), chr(205) x 31, chr(185), "\n");
        print(chr(186), " " x 31, chr(186), "\n");
        print(chr(186), " " x 31, chr(186), "\n");
        print(chr(186), " " x 6, "Victorias Music App", " " x 6, chr(186), "\n");
    }

    # Prints Title
    sub display_title {
        print(chr(186), " ", chr(201), chr(205), chr(203), chr(205), chr(187), " ", chr(201), "   ", chr(187), " ", chr(201), chr(205) x 4, " ", chr(205) x 2, chr(203), chr(205) x 2, " ", chr(201), chr(205) x 4, " ", chr(186), "\n");
        print(chr(186), " ", chr(186), " ", chr(186), " ", chr(186), " ", chr(186), "   ", chr(186), " ", chr(186), "       ", chr(186), "   ", chr(186), "     ", chr(186), "\n");
        print(chr(186), " ", chr(186), " ", chr(186), " ", chr(186), " ", chr(186), "   ", chr(186), " ", chr(200), chr(205) x 3, chr(187), "   ", chr(186), "   ", chr(186), "     ", chr(186), "\n");
        print(chr(186), " ", chr(186), " ", chr(186), " ", chr(186), " ", chr(186), "   ", chr(186), "     ", chr(186), "   ", chr(186), "   ", chr(186), "     ", chr(186), "\n");
        print(chr(186), " ", chr(200), " ", chr(202), " ", chr(188), " ", chr(200), chr(205) x 3, chr(188), " ", chr(205) x 4, chr(188), " ", chr(205) x 2, chr(202), chr(205) x 2, " ", chr(200), chr(205) x 4, " ", chr(186), "\n");
    }

    # Prints Footer
    sub display_footer {
        print(chr(186), " " x 31, chr(186), "\n");
        print(chr(186), " " x 23, "Victoria", chr(186), "\n");
        print(chr(204), chr(205) x 31, chr(185), "\n");
        print(chr(186), "     Apps     Home     Back    ", chr(186), "\n");
        print(chr(200), chr(205) x 31, chr(188), "\n");
    }

    # $_[0] is first parameter when mobile_body(location) is called.
    if ($_[0] eq "Header") {
        display_header(); # Calls Header Function
    }
    elsif ($_[0] eq "Title") {
        display_title(); # Calls Title Function
    }
    elsif ($_[0] eq "Footer") {
        display_footer(); # Calls Footer Function
    }
}

sub attempts_counter {
    # Prints Attempts Left
    # $_[0] first parameter that stores a decrementing integer
    print("       Login Attempts Left:", $_[0], "    \n");
    print(" " x 33, "\n");
}

sub display_total {
    # Outputs the total inventory size / hash size
    my @keys = keys %product_dict;
    my $size = @keys;
    print(" " x 33, "\n");
    print(" Store Database: Total Item/s= ", $size, "\n");
    print(" " x 33, "\n");
}

sub display_items {
    # Displays all current %product_dict values (Restock Included)
    print(" " x 33, "\n");
    print("List Of Items:\n");
    my $counter = 1;
    foreach my $key (keys %product_dict) {
        print($counter, ". ", $key, "\n");
        print("Quantity (Pcs.): ", $product_dict{$key}[0], "\n");
        print("Price Per Item: PHP", $product_dict{$key}[1], "\n");
        print("Warranty (Months): ", $product_dict{$key}[2], "\n");
        print("Restock  (Pcs.): ", $product_dict{$key}[3], "\n");
        print(" " x 33, "\n");
        $counter += 1;
    }
}

sub display_items_two {
    # Displays all current %product_dict values (Restock Not Included)
    print(" " x 33, "\n");
    print("Viewing Music Store Items:\n");
    my $counter = 1;
    foreach my $key (keys %product_dict) {
        print($counter, ". ", $key, "\n");
        print("Quantity (Pcs.): ", $product_dict{$key}[0], "\n");
        print("Price Per Item: PHP", $product_dict{$key}[1], "\n");
        print("Warranty (Months): ", $product_dict{$key}[2], "\n");
        print(" " x 33, "\n");
        $counter += 1;
    }
}

# Login / Register / General Input Functions
sub general_input {
    # Calls respective input print
    sub two_input {
        print(" " x 10, "Input (1/2):");
        my $my_input = <>;
        return ($my_input);
    }

    sub four_input {
        print(" " x 8, "Input (1/2/3/4):");
        my $my_input = <>;
        return ($my_input);
    }

    sub three_input {
        print(" " x 9, "Input (1/2/3):");
        my $my_input = <>;
        return ($my_input);
    }

    sub five_input {
        print(" " x 7, "Input (1/2/3/4/5):");
        my $my_input = <>;
        return ($my_input);
    }

    # $_[0] = input choices
    # $_[1] = location value / origin function name
    # $_[2] = current user
    my $flag_value = 1;
    while ($flag_value == 1) {
        if ($_[0] == 2) {
            my $input_val = two_input();
            if ($input_val >= 1 and $input_val <= 2) {
                if ($_[1] eq "main_home") {
                    hub_portals_first($input_val);
                    $flag_value = 0;
                }
            }
            else {
                print(" " x 6, "Error: Not In Choices.\n");
                print(" " x 33, "\n");
                $flag_value = 1;
            }

        }
        elsif ($_[0] == 3) {
            my $input_val = three_input();
            if ($input_val >= 1 and $input_val <= 3) {
                if ($_[1] eq "guest_menu") {
                    guest_portal_one($input_val, $_[2]);
                    $flag_value = 0;
                }
            }
            else {
                print(" " x 6, "Error: Not In Choices.\n");
                print(" " x 33, "\n");
                $flag_value = 1;
            }
        }
        elsif ($_[0] == 4) {
            my $input_val = four_input();
            if ($input_val >= 1 and $input_val <= 4) {
                if ($_[1] eq "login_register") {
                    hub_portals_two($input_val);
                    $flag_value = 0;
                }
            }
            else {
                print(" " x 6, "Error: Not In Choices.\n");
                print(" " x 33, "\n");
                $flag_value = 1;
            }
        }
        elsif ($_[0] == 5) {
            my $input_val = five_input();
            if ($input_val >= 1 and $input_val <= 5) {
                if ($_[1] eq "admin_menu") {
                    admin_portal_one($input_val);
                    $flag_value = 0;
                }
            }
            else {
                print(" " x 6, "Error: Not In Choices.\n");
                print(" " x 33, "\n");
                $flag_value = 1;
            }
        }
        else {
            print(" " x 6, "Error: Not In Choices.\n");
            print(" " x 33, "\n");
            $flag_value = 1;
        }
    }
}

sub login_input {
    my $admin;
    my $guest;
    # Login Input for Admin
    *login_admin = sub {
        my $flag_value = 1;
        $admin = App_access->new({});
        my $fetched_user = $admin->get_user_name;
        my $fetched_pass = $admin->get_pass_word;
        my $fetched_attempt = $admin->get_login_attempt;
        print(" " x 6, "Default Username:", $fetched_user, "\n");
        print(" " x 6, "Default Password:", $fetched_pass, "\n");
        print(" " x 33, "\n");
        while ($flag_value == 1) {
            print(" " x 7, "Input Username:");
            my $admin_user = <>;
            chomp($admin_user);
            print(" " x 7, "Input Password:");
            my $admin_pass = <>;
            chomp($admin_pass);
            my $user_compare = $admin_user eq $fetched_user;
            my $pass_compare = $admin_pass eq $fetched_pass;
            if ($user_compare == 1 and $pass_compare == 1) {
                print(" " x 9, "Login Successful.\n");
                $admin = App_access::DESTROY;
                admin_menu();
                $flag_value = 0;
            }
            else {
                print(" " x 33, "\n");
                print("    Error: Invalid User / Pass.\n");
                $fetched_attempt -= 1;
                attempts_counter($fetched_attempt);
                if ($fetched_attempt == 0) {
                    print("Error: Going Back To Login Page..\n");
                    login_register();
                }
            }
        }
    };

    # Login Input for Guest
    *login_guest = sub {
        my $flag_value = 1;
        $guest = App_access->new({});
        my $fetched_attempt = $guest->get_login_attempt;
        while ($flag_value == 1) {
            print(" " x 7, "Input Username:");
            my $guest_user = <>;
            chomp($guest_user);
            $guest->set_user_name($guest_user);
            my $provided_user = $guest->get_user_name;
            print(" " x 7, "Input Password:");
            my $guest_pass = <>;
            chomp($guest_pass);
            $guest->set_pass_word($guest_pass);
            my $provided_pass = $guest->get_pass_word;
            foreach my $key (keys %important_credentials) {
                if ($key eq $provided_user and $important_credentials{$key}[2] eq $provided_pass) {
                    print(" " x 9, "Login Successful.");
                    print(" " x 33, "\n");
                    $guest = App_access::DESTROY;
                    guest_menu($provided_user);
                    $flag_value = 0;
                }
                else {
                    print(" " x 33, "\n");
                    print("    Error: Invalid User / Pass.\n");
                    $fetched_attempt -= 1;
                    attempts_counter($fetched_attempt);
                    if ($fetched_attempt == 0) {
                        print("Error: Going Back To Login Page..\n");
                        login_register();
                    }
                }
            }
        }
    };

    # $_[0] is first parameter when login_input(user) is called.
    if ($_[0] eq "admin") {
        login_admin();
    }
    elsif ($_[0] eq "guest") {
        login_guest();
    }
}

sub register_input {
    # Converts Scalar (String) to Title Case
    sub str_to_title {
        local $_ = shift;
        s/(\w+\S*\w*)/\u\L$1/g;
        return $_;
    }

    # Checks Scalar (String) If Composed of Letter/Numbers/Both
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

    my $flag_value_one = 1;
    my $flag_value_two = 1;
    my $full_name;
    my $user_name;
    my $user_email;
    my $user_num;
    my $user_age;
    my $user_pass;
    print("Register Details\n");
    print(" " x 5, "\n");
    while ($flag_value_one == 1) {
        print("Full Name:");
        $full_name = <>;
        $full_name = str_to_title($full_name);
        $flag_value_one = 0;
    }
    $flag_value_one = 1;
    while ($flag_value_one == 1) {
        print("User Name:");
        $user_name = <>;
        chomp($user_name);
        if (exists($general_credentials{$user_name})) {
            print("Error: Username already exists.\n");
            print(" " x 5, "\n");
        }
        else {
            $flag_value_one = 0;
        }
    }

    $flag_value_one = 1;
    while ($flag_value_one == 1) {
        my $domain = "@";
        print("Email Address:");
        $user_email = <>;
        if (index($user_email, $domain) != -1) {
            $flag_value_one = 0;
        }
        else {
            print("Error: Invalid Email.\n");
            print(" " x 5, "\n");
            $flag_value_one = 1;
        }
    }

    $flag_value_one = 1;
    while ($flag_value_one == 1) {
        print("Contact Number: (+63)");
        $user_num = <>;
        $user_num = $user_num . "";
        if (check($user_num) == 1) {
            if (length($user_num) == 11) {
                $flag_value_one = 0;
            }
            else {
                print("Error: Number length must be 10.\n");
                print(" " x 5);
            }
        }
        else {
            print("Error: Number can't have letters.\n");
            print(" " x 5, "\n");
        }
    }
    $flag_value_one = 1;
    while ($flag_value_one == 1) {
        print("User Age:");
        $user_age = <>;
        if (check($user_age) == 1) {
            if ($user_age > 0 and $user_age <= 17) {
                print("Error: You are still a minor.\n");
                print(" " x 5, "\n");
            }
            elsif ($user_age >= 18 and $user_age <= 100) {
                $flag_value_one = 0;
            }
            else {
                print("Error: Invalid age to use this.\n");
                print(" " x 5, "\n");
            }
        }
        else {
            print("Error: Number can't have letters.\n");
            print(" " x 5, "\n");
        }
    }
    $flag_value_one = 1;
    while ($flag_value_one == 1) {
        print("User Password:");
        $user_pass = <>;
        while ($flag_value_two == 1) {
            print("Verify Password:");
            my $verify_pass = <>;
            print(" " x 5, "\n");
            if ($user_pass eq $verify_pass) {
                $flag_value_two = 0;
                $flag_value_one = 0;
            }
        }
    }
    # Clean Trailing New Line Before Returning
    chomp($full_name);
    chomp($user_name);
    chomp($user_email);
    chomp($user_num);
    chomp($user_age);
    chomp($user_pass);
    return ($full_name, $user_name, $user_email, $user_num, $user_age, $user_pass);
}

sub cash_input {
    my $flag_value = 1;
    print("           ENTER AMOUNT          \n");
    print(" " x 33, "\n");
    print("Initial Money:", $important_credentials{$_[0]}[0], "\n");
    while ($flag_value == 1) {
        print("Load Amount:");
        my $money_load = <>;
        chomp($money_load);
        $money_load = int($money_load);
        if ($money_load >= 500 and $money_load <= 50000) {
            $important_credentials{$_[0]}[0] += $money_load;
            $flag_value = 0;
        }
        elsif ($money_load == 0) {
            guest_menu($_[0]);
        }
        else {
            print(" " x 33, "\n");
            print("    Error: Value Not In Range.\n");
            print(" " x 33, "\n");
        }
    }
    print(" " x 33, "\n");
    print("Updated Balance:", $important_credentials{$_[0]}[0], "\n");
    print(" " x 33, "\n");
    print("    Money Successfully Loaded    \n");
    print("   Going Back To Main Page....   \n");
}

# Dashboard Functions
sub main {
    main_home();
}

sub main_home {
    my $input_choice = 2;
    my $location_val = "main_home";
    mobile_body("Header");
    mobile_body("Title");
    print(chr(186), "   MUSIC INVENTORY PROTOTYPE   ", chr(186), "\n");
    print(chr(186), "  CASE STUDY PROJ DNIPROGLANG  ", chr(186), "\n");
    print(chr(186), " " x 31, chr(186), "\n");
    print(chr(186), "      [1 - ACCESS PROGRAM]     ", chr(186), "\n");
    print(chr(186), "    [2 - CLOSE THE PROGRAM]    ", chr(186), "\n");
    print(chr(186), " " x 31, chr(186), "\n");
    mobile_body("Footer");
    general_input($input_choice, $location_val);
}

*hub_portals_first = sub {
    sub login_register {
        my $input_choice = 4;
        my $location_val = "login_register";
        mobile_body("Header");
        mobile_body("Title");
        print(chr(186), "       LOGIN / REGISTER        ", chr(186), "\n");
        print(chr(186), " " x 31, chr(186), "\n");
        print(chr(186), "      [1 - LOGIN AS ADMIN]     ", chr(186), "\n");
        print(chr(186), "      [2 - LOGIN AS GUEST]     ", chr(186), "\n");
        print(chr(186), "        [3 - REGISTER ]        ", chr(186), "\n");
        print(chr(186), "         [4 - GO BACK]         ", chr(186), "\n");
        mobile_body("Footer");
        general_input($input_choice, $location_val);
    }

    sub close_program {
        mobile_body("Header");
        mobile_body("Title");
        print(chr(186), "   MUSIC INVENTORY PROTOTYPE   ", chr(186), "\n");
        print(chr(186), "  CASE STUDY PROJ DNIPROGLANG  ", chr(186), "\n");
        print(chr(186), " " x 31, chr(186), "\n");
        print(chr(186), "           GOOD DAY!           ", chr(186), "\n");
        print(chr(186), "      THANK YOU FOR USING!     ", chr(186), "\n");
        print(chr(186), "          CLOSING....          ", chr(186), "\n");
        mobile_body("Footer");
        $prod_add = Product_add::DESTROY;
        $prod_add = Product_edit::DESTROY;
        $prod_compute = Product_compute::DESTROY;
    }

    # $_[0] = respective button number
    if ($_[0] == 1) {
        login_register();
    }
    elsif ($_[0] == 2) {
        close_program();
    }
};

sub hub_portals_two {
    sub access_admin {
        my $location_val = "admin";
        mobile_body("Header");
        mobile_body("Title");
        print(chr(186), "          LOGIN ADMIN          ", chr(186), "\n");
        print(chr(186), "  INPUT THE FOLLOWING DETAILS  ", chr(186), "\n");
        print(chr(186), " " x 31, chr(186), "\n");
        print(chr(186), "   Admin Username :            ", chr(186), "\n");
        print(chr(186), "   Admin Password :            ", chr(186), "\n");
        print(chr(186), "      Login Attempt/s = 3      ", chr(186), "\n");
        mobile_body("Footer");
        login_input($location_val)
    }

    sub access_client {
        my $location_val = "guest";
        mobile_body("Header");
        mobile_body("Title");
        print(chr(186), "          LOGIN GUEST          ", chr(186), "\n");
        print(chr(186), "  INPUT THE FOLLOWING DETAILS  ", chr(186), "\n");
        print(chr(186), " " x 31, chr(186), "\n");
        print(chr(186), "   Guest Username :            ", chr(186), "\n");
        print(chr(186), "   Guest Password :            ", chr(186), "\n");
        print(chr(186), "      Login Attempt/s = 3      ", chr(186), "\n");
        mobile_body("Footer");
        login_input($location_val)
    }

    sub access_register {
        my $credit_balance = 99;
        my @current_general = ();
        my @current_important = ();
        mobile_body("Header");
        mobile_body("Title");
        print(chr(186), "         REGISTER GUEST        ", chr(186), "\n");
        print(chr(186), "  INPUT THE FOLLOWING DETAILS  ", chr(186), "\n");
        print(chr(186), "                               ", chr(186), "\n");
        print(chr(186), "   Full Name:    Password:     ", chr(186), "\n");
        print(chr(186), "   User Name:    Contact #:    ", chr(186), "\n");
        print(chr(186), "   Email Add:    Age:          ", chr(186), "\n");
        mobile_body("Footer");
        my ($full_name, $user_name, $user_email, $user_num, $user_age, $user_pass) = register_input();
        # Username will serve as keys for General Dict and Login Dict
        # Append All General Details To Array To Prepare To Append In Dictionary
        push(@current_general, $full_name);
        push(@current_general, $user_email);
        push(@current_general, $user_num);
        push(@current_general, $user_age);
        push(@current_general, $user_pass);
        # Append All Important Details To Array To Prepare To Append In Dictionary
        push(@current_important, $credit_balance);
        push(@current_important, $user_email);
        push(@current_important, $user_pass);
        $general_credentials{$user_name} = [ @current_general ];
        $important_credentials{$user_name} = [ @current_important ];
        print("   Successfully Registered.   \n");

        # Print Statement For Value Checking
        #for my $family ( keys %general_credentials ) { print "$family: @{ $general_credentials{$family} }\n"; }
        #for my $family (keys %important_credentials) {print "$family: @{$important_credentials{$family}}\n";}
        login_register();
    }

    sub go_back {
        main_home();
    }

    # $_[0] = respective button number
    if ($_[0] == 1) {
        access_admin();
    }
    elsif ($_[0] == 2) {
        access_client();
    }
    elsif ($_[0] == 3) {
        access_register();
    }
    elsif ($_[0] == 4) {
        go_back();
    }
}

sub admin_menu {
    my $input_choice = 5;
    my $location_val = "admin_menu";
    mobile_body("Header");
    mobile_body("Title");
    print(chr(186), " (Admin Controls For Checking) ", chr(186), "\n");
    print(chr(186), "       [1 - Add Record/s]      ", chr(186), "\n");
    print(chr(186), "      [2 - Edit Record/s]      ", chr(186), "\n");
    print(chr(186), "     [3 - Delete Record/s]     ", chr(186), "\n");
    print(chr(186), "     [4 - Compute Record/s]    ", chr(186), "\n");
    print(chr(186), "         [5 - Sign Out]        ", chr(186), "\n");
    mobile_body("Footer");
    general_input($input_choice, $location_val);
}

*admin_portal_one = sub {
    # $_[0] = respective button number
    if ($_[0] == 1) { # Add or Restocks Inventory
        my $a, my $b, my $c, my $d, my $e;
        my $flag_value_one = 1;
        while ($flag_value_one == 1) {
            print(" " x 33, "\n");
            print("     Add or Restock? (1/2):");
            my $add_choice = <>;
            if ($add_choice == 1) {
                $prod_add = Product_add->new({});
                my @current_item = ();
                display_total();
                print(" Add Record Menu. Input Details.\n");
                my $flag_value_two = 1;
                while ($flag_value_two == 1) {
                    $a = Product_add::add_name();
                    if (exists($product_dict{$a})) {
                        print(" " x 33, "\n");
                        print("  Error: Item Found In Database.\n");
                        print("        Restock Instead.        \n");
                        admin_menu();
                    }
                    $flag_value_two = 0;
                }
                $flag_value_two = 1;
                $b = Product_add::add_quan();
                $c = Product_add::add_price();
                $d = Product_add::add_warranty();
                $e = 0;
                push(@current_item, $b);
                push(@current_item, $c);
                push(@current_item, $d);
                push(@current_item, $e);
                $product_dict{$a} = [ @current_item ];
                print(" " x 33, "\n");
                print("    Item Successfully Added.    \n");
                $flag_value_one = 0;
            }
            elsif ($add_choice == 2) {
                $prod_edit = Product_edit->new({});
                my @current_item = ();
                display_total();
                print("Restock Quan Menu. Input Details.\n");
                print("Type A/a To Return To Admin Menu.\n");
                display_items();
                my $flag_value_two = 1;
                while ($flag_value_two == 1) {
                    print("Choose Item To Restock Quantity:");
                    my $a = <>;
                    chomp($a);
                    if ($a eq "A" or $a eq "a") {
                        admin_menu();
                    }
                    if (exists($product_dict{$a})) {
                        print("Item Name: ", $a, "\n");
                        my $e = Product_add::add_quan();
                        push(@current_item, $product_dict{$a}[0] + $e);
                        push(@current_item, $product_dict{$a}[1]);
                        push(@current_item, $product_dict{$a}[2]);
                        push(@current_item, $product_dict{$a}[3] + $e);
                        $product_dict{$a} = [ @current_item ];
                        print("  Item Successfully Restocked.  \n");
                        $flag_value_one = 0;
                    }
                    else {
                        print("     Error: Not In Choices.\n");
                        print(" " x 33, "\n");
                    }
                    $flag_value_two = 0;
                }
                $flag_value_one = 0;
            }
            else {
                print("   Error: Input Not In Choices.\n");
            }
        }
        admin_menu();
    }
    elsif ($_[0] == 2) { # Edit Inventory
        $prod_edit = Product_edit->new({});
        my $b, my $c, my $d;
        my @current_item = ();
        print(" " x 33, "\n");
        print("Edit Records Menu. Input Details.\n");
        print("Type A/a To Return To Admin Menu.\n");
        display_items();
        my $flag_value_one = 1;
        while ($flag_value_one == 1) {
            print("Choose Item To Edit Details:");
            my $a = <>;
            chomp($a);
            if ($a eq "A" or $a eq "a") {
                admin_menu();
            }
            if (exists($product_dict{$a})) {
                print("Item Name: ", $a, "\n");
                $b = Product_edit::edit_quan();
                $c = Product_edit::edit_price();
                $d = Product_edit::edit_warranty;
                my $e = $product_dict{$a}[3];
                push(@current_item, $b);
                push(@current_item, $c);
                push(@current_item, $d);
                push(@current_item, $e);
                $product_dict{$a} = [ @current_item ];
                print("   Item Successfully Edited.    \n");
                $flag_value_one = 0;
            }
            else {
                print("     Error: Not In Choices.\n");
                print(" " x 33, "\n");
            }
        }
        admin_menu();
    }
    elsif ($_[0] == 3) { # Delete Inventory
        print(" " x 33, "\n");
        print("Delete Record Menu. Input Details.\n");
        display_items();
        my $flag_value_one = 1;
        while ($flag_value_one == 1) {
            print("Choose Item To Delete:");
            my $a = <>;
            chomp($a);
            if ($a eq "A" or $a eq "a") {
                admin_menu();
            }
            if (exists($product_dict{$a})) {
                print("Deleting: ", $a, "\n");
                delete $product_dict{$a};
                print("   Item Successfully Deleted.    \n");
            }
            else {
                print("     Error: Not In Choices.\n");
                print(" " x 33, "\n");
            }
            $flag_value_one = 0;
        }
        admin_menu();
    }
    elsif ($_[0] == 4) { # Compute Inventory
        $prod_compute = Product_compute->new({});
        print(" " x 33, "\n");
        print("Exporting Record Menu.\n");
        Product_compute::compute(%product_dict);
        print("Item Successfully Written To File\n");
        admin_menu();
    }
    elsif ($_[0] == 5) {
        login_register();
    }
};

sub guest_menu {
    my $current_guest = $_[0];
    my $input_choice = 3;
    my $location_val = "guest_menu";
    mobile_body("Header");
    mobile_body("Title");
    print(chr(186), "  (Guest Controls For Buying)  ", chr(186), "\n");
    print(chr(186), " " x 31, chr(186), "\n");
    print(chr(186), "      [1 - Buy Product/s]      ", chr(186), "\n");
    print(chr(186), "       [2 - Load E-Load]       ", chr(186), "\n");
    print(chr(186), "         [3 - Sign Out]        ", chr(186), "\n");
    print(chr(186), " " x 31, chr(186), "\n");
    mobile_body("Footer");
    print("   Welcome To Music Store, ", $current_guest, "\n");
    print("Current Balance: PHP", $important_credentials{$current_guest}[0], "\n");
    print(" " x 33, "\n");
    general_input($input_choice, $location_val, $current_guest);
}

sub guest_portal_one {
    my $current_guest = $_[1];

    *add_product = sub {
        my @current_order = ();
        display_items_two();
        my $flag_value = 1;
        while ($flag_value == 1) {
            print("  Choose Item/s To Add To Cart:  \n");
            print("Type A/a To Return To Guest Menu.\n");
            print("Choice: ");
            my $choice_item = <>;
            chomp($choice_item);
            if ($choice_item eq "A" or $choice_item eq "a") {
                guest_menu($current_guest);
            }
            if (exists($product_dict{$choice_item})) {
                print("Quantity To Buy?: ");
                my $choice_quan = <>;
                chomp($choice_quan);
                $choice_quan = int($choice_quan);
                if ($choice_quan <= $product_dict{$choice_item}[0]) {
                    if ($important_credentials{$current_guest}[0] >= $choice_quan * $product_dict{$choice_item}[1]) {
                        print(" " x 31, "\n");
                        print("Item Name: ", $choice_item, "\n");
                        print("Total Quantity: ", $choice_quan, "\n");
                        print("Total Price: PHP", $choice_quan * $product_dict{$choice_item}[1], "\n");
                        print(" " x 31, "\n");
                        print("Sure to check this out? (Y/N): ");
                        my $yes_no = <>;
                        chomp($yes_no);
                        if ($yes_no eq "Y" or $yes_no eq "y") {
                            $important_credentials{$current_guest}[0] -= $choice_quan * $product_dict{$choice_item}[1]; # Deduct Money
                            $product_dict{$choice_item}[0] -= $choice_quan;                                             # Deduct Quantity
                            push(@current_order, $choice_item);
                            push(@current_order, $choice_quan);
                            push(@current_order, $choice_quan * $product_dict{$choice_item}[1]);
                            $order_dict{$current_guest} = [ @current_order ];
                            print(" " x 31, "\n");
                            print(" Invoice Saved To Your Cart.\n");
                            guest_menu($current_guest);
                        }
                        else {
                            print(" " x 31, "\n");
                            print("Invoice Not Saved To Your Cart.\n");
                            guest_menu($current_guest);
                        }
                    }
                    else {
                        print(" " x 31, "\n");
                        print("Error: Insufficient Card Balance.\n");
                        guest_menu($current_guest);
                    }
                }
                else {
                    print(" " x 31, "\n");
                    print("Error: Insufficient Item Quantity.\n");
                    guest_menu($current_guest);
                }
                $flag_value = 0;
            }
            else {
                print("     Error: Not In Choices.\n");
                print(" " x 33, "\n");
            }
        }
        guest_menu($current_guest);
    };

    *load_money = sub {
        mobile_body("Header");
        mobile_body("Title");
        print(chr(186), "       ENTER AMOUNT IN PHP     ", chr(186), "\n");
        print(chr(186), "                               ", chr(186), "\n");
        print(chr(186), "        PHP:___________        ", chr(186), "\n");
        print(chr(186), "     Minimum of PHP 500.00     ", chr(186), "\n");
        print(chr(186), "    Maximum of PHP 50000.00    ", chr(186), "\n");
        print(chr(186), "         [0 - GO BACK]         ", chr(186), "\n");
        mobile_body("Footer");
        cash_input($current_guest);
        guest_menu($current_guest);
    };

    # $_[0] respective button number
    if ($_[0] == 1) {
        add_product();
    }
    elsif ($_[0] == 2) {
        load_money();
    }
    elsif ($_[0] == 3) {
        login_register();
    }
}

main();