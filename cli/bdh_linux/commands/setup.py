import typer
import subprocess
from rich import print

app = typer.Typer(help="Setup bdh-linux components")

def run(cmd: str):
    subprocess.run(cmd, shell=True)

@app.command()
def terminal():
    """Setup ZSH + BDH prompt + aliases"""
    print("[cyan]⚡ Setting up bdh-linux Terminal...[/cyan]")
    print("=" * 30)

    # Install ZSH
    print("[yellow]📦 Installing ZSH...[/yellow]")
    run("sudo pacman -S --noconfirm zsh")

    # Oh My Zsh
    print("[yellow]⚡ Installing Oh My Zsh...[/yellow]")
    run('sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended')

    # Copy configs
    print("[yellow]🔧 Applying BDH configs...[/yellow]")
    run("cp ~/.bdh-linux/configs/.zshrc ~/.zshrc")
    run("cp ~/.bdh-linux/configs/aliases.sh ~/.aliases.sh")

    # Set ZSH as default
    run("chsh -s /bin/zsh")

    print("")
    print("[green]✅ Terminal setup done![/green]")
    print("[green]Restart terminal to apply![/green]")

@app.command()
def packages():
    """Install all BDH packages"""
    print("[cyan]⚡ Setting up BDH Packages...[/cyan]")
    print("=" * 30)

    run("bash ~/.bdh-linux/scripts/install-packages.sh")

    print("")
    print("[green]✅ Packages setup done![/green]")

@app.command()
def git():
    """Setup Git global config"""
    print("[cyan]⚡ Setting up Git...[/cyan]")
    print("=" * 30)

    name = typer.prompt("Your name")
    email = typer.prompt("Your email")

    run(f'git config --global user.name "{name}"')
    run(f'git config --global user.email "{email}"')
    run("git config --global init.defaultBranch main")

    print("")
    print("[green]✅ Git setup done![/green]")

@app.command()
def docker():
    """Install and setup Docker"""
    print("[cyan]⚡ Setting up Docker...[/cyan]")
    print("=" * 30)

    run("sudo pacman -S --noconfirm docker docker-compose")
    run("sudo systemctl enable docker")
    run("sudo systemctl start docker")
    run("sudo usermod -aG docker $USER")

    print("")
    print("[green]✅ Docker setup done![/green]")