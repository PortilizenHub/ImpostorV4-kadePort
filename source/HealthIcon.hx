package;

import flixel.FlxG;
import flixel.FlxSprite;

using StringTools;

class HealthIcon extends FlxSprite
{
	public var char:String = 'bf';
	public var isPlayer:Bool = false;
	public var isOldIcon:Bool = false;

	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new(?char:String = "bf", ?isPlayer:Bool = false)
	{
		super();

		this.char = char;
		this.isPlayer = isPlayer;

		isPlayer = isOldIcon = false;

		if (FlxG.save.data.antialiasing)
		{
			switch(char)
			{
				case 'bf-pixel' | 'tomongus'| 'hamster' | 'bf-sus':
					antialiasing = false;
				default:
					antialiasing = true;
			}
		}

		switch(char)
		{
			case 'bf-sus':
				this.char = 'bf-pixel';

			case 'bf-fall' | 'bfg' | 'bfr' | 'ziffy':
				this.char = 'bf';

			case 'crewmate':
				this.char = 'green_crewmate';

			case 'impostor3' | 'impostorr':
				this.char = 'green_impostor';

			case 'gf':
				this.char = 'bf-pixel';
		}

		changeIcon(this.char);
		scrollFactor.set();
	}

	public function swapOldIcon()
	{
		trace('no');
	}

	public function changeIcon(char:String)
	{
		if (char != 'bf-pixel')
			char = char.split("-")[0];


		loadGraphic(Paths.image('icons/icon-' + char), true, 150, 150);
		animation.add(char, [0, 1], 0, false, isPlayer);
		animation.play(char);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
