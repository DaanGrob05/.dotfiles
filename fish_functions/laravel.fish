

function artisan --description 'Alias that helps fish recognize artisan as a command that should be completed'
    sail artisan $argv
end

function __fish_artisan_commands_with_descriptions
    begin
        sail artisan list --raw 2>/dev/null
        or return
    end | grep -vE '^ ' | string replace -r '\s+' '\t'
end

function __fish_artisan_commands
    __fish_artisan_commands_with_descriptions | cut -f 1
end

complete -c artisan -f -n 'test -f artisan; and __fish_use_subcommand' -a '(__fish_artisan_commands_with_descriptions)'
complete -c artisan -f -n 'test -f artisan; and __fish_seen_subcommand_from help' -a '(__fish_artisan_commands)'

complete -c php -x -a '(__fish_complete_subcommand)'

function laravel_new --description 'Create a new Laravel project'
    curl -s https://laravel.build/$argv\?with=mysql | bash
end
