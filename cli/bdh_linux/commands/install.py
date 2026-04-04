import typer
import subprocess
from rich import print

app = typer.Typer(help="Install bdh-linux packages")

def run(cmd: str):
    subprocess.run(cmd, shell=True)

@app.command()
def all():
    """Full BDH Linux install"""
    print("[cyan]⚡ bdh-linux — Full Install[/cyan]")
    print("=" * 30)
    
    # Packages
    print("[yellow]📦 Installing packages...[/yellow]")
    run("sudo pacman -S --noconfirm python python-pip git docker zsh neovim curl wget htop tree tmux")
    
    # Python packages
    print("[yellow]🐍 Installing Python packages...[/yellow]")
    run("pip install fastapi uvicorn sqlalchemy psycopg2-binary python-dotenv bdh-fastapi-new")
    
    # Oh My Zsh
    print("[yellow]⚡ Installing Oh My Zsh...[/yellow]")
    run('sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended')
    
    # BDH Configs
    print("[yellow]🔧 Applying BDH configs...[/yellow]")
    run("cp ~/.config/bdh-linux/configs/.zshrc ~/.zshrc")
run("cp ~/.config/bdh-linux/configs/aliases.sh ~/.aliases.sh")
    
    print("")
    print("[green]✅ bdh-linux installed![/green]")

@app.command()
def minimal():
    """Minimal bdh-linux install"""
    print("[cyan]⚡ bdh-linux — Minimal Install[/cyan]")
    print("=" * 30)
    
    # Basic only
    print("[yellow]📦 Installing basic packages...[/yellow]")
    run("sudo pacman -S --noconfirm python python-pip git zsh curl wget")
    
    print("[yellow]🐍 Installing Python packages...[/yellow]")
    run("pip install fastapi uvicorn bdh-fastapi-new")
    
    print("")
    print("[green]✅ Minimal install done![/green]")