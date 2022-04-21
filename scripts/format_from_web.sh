#!/bin/bash

# this script is used to clean the script source from https://www.fanfr.com/scripts/saison1vf/friendsgeneration2.php?nav=script&version=vf&episodescript=104

# Remplir tous les fichiers Saisons/Saison_XX/xxx.md, puis executer:
# ./scripts/format_from_web.sh Saisons/Saison_02/*

sed -i -r '
1,21d                                      # delete the website header
/Fiche détaillée et photos/{               # delete this line and the next one
	N;d
}
s/^\s+//                                   # remove heading spaces
s/^\s*Script Saison [0-9]+ (Episode [0-9]+)/## \1/          # add title header 2 for the episode title

s/^(\w[a-zA-Z \t\.&,]+:)/**\1**/           # add bold for people speaking
s/:\*\*(\w)/:** \1/                        # add space if missing
/\*\*\w[a-zA-Z \t\.&,]+:\*\*/{ 			   # if people speaking do not add title
	b checknextline
}
/^(Écrit|Réalisé|Transcrit|Traduit) par/{  # do not add header on this
	b checknextline
}
/^Titre (US|FR)/{                          # do not add header on this
	b checknextline
}
/Fan Club Français de Friends/d            # delete this

s/^([^#])/### \1/                          # remaining appears as a header 3


:checknextline                             # check next line is empty to always have empty line between two dialogs
n                                          # read line
/^$/!{                                     # if not empty
	s/^/\n/                                # add a \n
	P                                      # print the \n
	D                                      # start a new cycle with the previously read line
}
' "$@"

