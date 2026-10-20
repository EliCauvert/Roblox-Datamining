return {
	obfuscateUserId = function(p1): string
		return if p1 == nil then "<User ID: nil>" elseif p1 == 0 then "<User ID: 0>" else "<User ID: ####>"
	end,
	obfuscatePlayer = function(Player: Player): string
		if Player == nil then
			return "<Player: nil>"
		else
			local IsUserIdMatch: boolean = Player.UserId == 0 or Player.UserId == nil
			
			return string.format("<Player: ####%s>", if IsUserIdMatch then " [NO USER ID]" else "")
		end
	end
}