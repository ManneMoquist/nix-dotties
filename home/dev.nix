{ vars, lib, pkgs, config, ...}: let
  onePassPath = "~/.1password/agent.sock";
in {
  programs = {
    ssh = {
      enable = true;
      extraConfig = ''
      Host *
        IdentityAgent ${onePassPath}
      '';
    };

    git = {
      enable = true;
      extraConfig = {
        gpg.format = "ssh";
        "gpg \"ssh\"" =  {
          program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
        };

        commit = {
          gpgsign = true;
        };

        user = {
          signingKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCVsaQOuEdedAwC9XLVJj6sMh+YGvMoCkqMbxN1d1QOLLbirU2zIjPONtx1Jr4Vz+4ihBBI/yBD0cygpIi8UwYUBufB6nwnRx26yIR30qDzP97XISedYiO3IN+NxBAtAafjxfFyQvK8A3LBEujVDugL1R+O3g8pz5YafxxgA3GbaHb9lkT+AUvYXUK3EFUn8CPB8FOxPBBS1dtg/8U+2nOPxtm7KZAHg5gFCM3JXaQ2KTdFh4WeiE6w92fg2LMu5lQwcX2c9oLp22WNseBGarrWgHrR/O4EVa5nAB/jCypEHk01f82QyZz7PprVkqA1JAqiLsGO5R9JnuZn3Xt9ARbpm5v50n7nvI0ox1DpkUBpFhdymvFyY0SH2DK96nlyMRroo3J5FSOVZdL/uEq3AryW44Yr8y8jtaUx6UzXdUU5fmb2s3ljhgsx1sIzQmQ0l00dbKUqSYX1Dn4dS3o7okEUJ7xBtrmaN/iQkqCBEilnhLyPRTsUfAPrS0ZbO0AJ/8UlKCpbbhSuJazjPBf+gamDwNtgv9QNaKH+/UD9IFMYyQojeI7nuk1Ptt4Z61MojrFMGuCM3X0DP05WjWpm8JuqOMjYYyL78liYJ/3qUFqfsW77G68lE4O90vJVOJoXFn0Es6c6/rcZOmMXMs0/hQD5ybQKMs3lx7+kRQ3ka84oTQ==";
        };
      };

    };
  };
  home.packages = [
    pkgs.go
    pkgs.ruby
    pkgs.ruby-lsp
    pkgs.openssl
  ];
}
