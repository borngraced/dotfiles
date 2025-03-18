import re
import shutil
import tempfile
import urllib.request
import zipfile
from io import BytesIO
from os import path

PLUGINS = """
bufexplorer https://github.com/jlanzarotta/bufexplorer
open_file_under_cursor.vim https://github.com/amix/open_file_under_cursor.vim
vim-addon-mw-utils https://github.com/MarcWeber/vim-addon-mw-utils
vim-bundle-mako https://github.com/sophacles/vim-bundle-mako
vim-coffee-script https://github.com/kchmck/vim-coffee-script
vim-indent-object https://github.com/michaeljsmith/vim-indent-object
vim-less https://github.com/groenewege/vim-less
vim-pyte https://github.com/therubymug/vim-pyte
vim-expand-region https://github.com/terryma/vim-expand-region
vim-fugitive https://github.com/tpope/vim-fugitive
vim-rhubarb https://github.com/tpope/vim-rhubarb
goyo.vim https://github.com/junegunn/goyo.vim
vim-zenroom2 https://github.com/amix/vim-zenroom2
vim-repeat https://github.com/tpope/vim-repeat
vim-commentary https://github.com/tpope/vim-commentary
vim-gitgutter https://github.com/airblade/vim-gitgutter
vim-flake8 https://github.com/nvie/vim-flake8
vim-pug https://github.com/digitaltoad/vim-pug
lightline.vim https://github.com/itchyny/lightline.vim
vim-abolish https://github.com/tpope/vim-abolish
rust.vim https://github.com/rust-lang/rust.vim
vim-markdown https://github.com/plasticboy/vim-markdown
vim-gist https://github.com/mattn/vim-gist
typescript-vim https://github.com/leafgarland/typescript-vim
vim-javascript https://github.com/pangloss/vim-javascript
vim-python-pep8-indent https://github.com/Vimjas/vim-python-pep8-indent
editorconfig-vim https://github.com/editorconfig/editorconfig-vim
vim-colors-off https://github.com/pbrisbin/vim-colors-off
vim-tabline https://github.com/lukelbd/vim-tabline
vim-easymotion https://github.com/easymotion/vim-easymotion
vim-lsp https://github.com/prabirshrestha/vim-lsp
vim-themes https://github.com/mswift42/vim-themes
zenburn https://github.com/jnurmine/Zenburn
vim-habamax https://github.com/habamax/vim-habamax
tender.vim https://github.com/jacoborus/tender.vim
Apprentice https://github.com/romainl/Apprentice.vim
vim-nod https://github.com/habamax/vim-nod
""".strip()

GITHUB_ZIP = "%s/archive/master.zip"

SOURCE_DIR = path.join(path.dirname(__file__), "plugins_forked")


def download_extract_replace(plugin_name, zip_path, temp_dir, source_dir):
    # Download and extract file in temp dir
    with urllib.request.urlopen(zip_path) as req:
        zip_f = zipfile.ZipFile(BytesIO(req.read()))
        zip_f.extractall(temp_dir)
        content_disp = req.headers.get("Content-Disposition")

    filename = re.findall("filename=(.+).zip", content_disp)[0]
    plugin_temp_path = path.join(temp_dir, path.join(temp_dir, filename))

    # Remove the current plugin and replace it with the extracted
    plugin_dest_path = path.join(source_dir, plugin_name)

    try:
        shutil.rmtree(plugin_dest_path)
    except OSError:
        pass

    shutil.move(plugin_temp_path, plugin_dest_path)
    print("Updated {0}".format(plugin_name))


def update(plugin):
    name, github_url = plugin.split(" ")
    zip_path = GITHUB_ZIP % github_url
    try:
        download_extract_replace(name, zip_path, temp_directory, SOURCE_DIR)
    except Exception as exp:
        print("Could not update {}. Error was: {}".format(name, str(exp)))


if __name__ == "__main__":
    temp_directory = tempfile.mkdtemp()

    try:
        [update(x) for x in PLUGINS.splitlines()]
    finally:
        shutil.rmtree(temp_directory)
