use strict;
use Irssi qw(command_bind active_win);
our $VERSION = '1.1.0';
our %IRSSI = (
    authors     => 'prussian',
    contact     => 'genunrest@gmail.com',
    name        => 'fullwidth',
    url         => 'http://github.com/GeneralUnRest/',
    description => 'talk like some vaporwave cool kid',
    license     => 'Apache 2.0',
);

command_bind(fullwidth => sub {
    my $msg = $_[0];
    my $say = "";
    foreach my $char (split //, $msg) {
        if ($char =~ /\s/) {
            $say = "$say" . " ";
        }
        else {
            my $nchar = ord($char);
            if ($nchar >= 32 && $nchar <= 126) {
                $say = "$say" . chr($nchar+65248);
            }
        }
    }
    active_win->command("say $say");
});
