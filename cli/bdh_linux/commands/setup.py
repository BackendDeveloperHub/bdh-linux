import typer
import subprocess
import os
from rich import print

app = typer.Typer(help="Setup bdh-linux components")

BASE_URL = "https://raw.githubusercontent.com/BackendDeveloperHub/bdh-linux/main"

def run(cmd: str):
    subprocess.run(cmd, shell=True)

@app.command()
def terminal():
    """Setup ZSH + BDH prompt + aliases"""
    print("[cyan]⚡ Setting up bdh-linux Terminal...[/cyan]")
    print("=" * 30)

    # Install ZSH
    print("[yellow]📦 Installing ZSH...[/yellow]")
    run("sudo pacman -S --noconfirm zsh git curl")

    # Oh My Zsh
    if not os.path.isdir(os.path.expanduser("~/.oh-my-zsh")):
        print("[yellow]⚡ Installing Oh My Zsh...[/yellow]")
        run("git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh")
    else:
        print("[yellow]⚡ Oh My Zsh already exists, skipping...[/yellow]")

    # Powerlevel10k
    if not os.path.isdir(os.path.expanduser("~/.oh-my-zsh/custom/themes/powerlevel10k")):
        print("[yellow]🎨 Installing Powerlevel10k...[/yellow]")
        run("git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k")
    else:
        print("[yellow]⚡ Powerlevel10k already exists, skipping...[/yellow]")

    # Plugins
    if not os.path.isdir(os.path.expanduser("~/.oh-my-zsh/custom/plugins/zsh-autosuggestions")):
        run("git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions")

    if not os.path.isdir(os.path.expanduser("~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting")):
        run("git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting")

    # BDH Configs — curl வழியா
    print("[yellow]🔧 Applying BDH configs...[/yellow]")
    run(f"curl -fsSL {BASE_URL}/configs/.zshrc -o ~/.zshrc")
    run(f"curl -fsSL {BASE_URL}/configs/aliases.sh -o ~/.aliases.sh")

    # Shell மாத்த
    run("sudo usermod -s /bin/zsh $USER")

    print("")
    print("[green]✅ Terminal setup done![/green]")
    print("[green]💡 Run 'p10k configure' to customize prompt![/green]")
    print("[green]⚡ Restart terminal to apply![/green]")

@app.command()
def packages():
    """Install all BDH packages"""
    print("[cyan]⚡ Setting up BDH Packages...[/cyan]")
    print("=" * 30)
    run(f"curl -fsSL {BASE_URL}/scripts/install-packages.sh -o /tmp/install-packages.sh")
    run("bash /tmp/install-packages.sh")
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
