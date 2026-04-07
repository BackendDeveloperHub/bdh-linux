import typer
import subprocess
from rich import print
import os

app = typer.Typer(help="Remove bloatware from system")

def run(cmd: str):
    subprocess.run(cmd, shell=True)

@app.command()
def bloat():
    """Remove all bloatware"""
    print("[cyan]⚡ BDH Linux — Removing Bloatware...[/cyan]")
    print("=" * 30)

    confirm = typer.confirm("Are you sure? This will remove games, office apps, media apps!")
    if not confirm:
        print("[yellow]Cancelled![/yellow]")
        raise typer.Exit()

    games()
    office()
    media()
    cleanup()

    print("")
    print("[green]✅ All bloatware removed![/green]")

@app.command()
def games():
    """Remove games"""
    print("[yellow]🗑️ Removing games...[/yellow]")
    run("sudo pacman -Rns --noconfirm manjaro-games steam hedgewars 2>/dev/null")
    print("[green]✅ Games removed![/green]")

@app.command()
def office():
    """Remove office apps"""
    print("[yellow]🗑️ Removing office apps...[/yellow]")
    run("sudo pacman -Rns --noconfirm libreoffice-fresh libreoffice-still 2>/dev/null")
    print("[green]✅ Office removed![/green]")

@app.command()
def media():
    """Remove media apps"""
    print("[yellow]🗑️ Removing media apps...[/yellow]")
    run("sudo pacman -Rns --noconfirm vlc rhythmbox shotwell transmission-gtk thunderbird 2>/dev/null")

   
@app.command()
def cleanup():
    """ remove cache and orphaned packages...")
    os.system("sudo pacman -Rns $(pacman -Qtdq) --noconfirm || true")
    os.system("sudo pacman -Sc --nocofirm")
    print("✅ System Cleaned successfully!")
