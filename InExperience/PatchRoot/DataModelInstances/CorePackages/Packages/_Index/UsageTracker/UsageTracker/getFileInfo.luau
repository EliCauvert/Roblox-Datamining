local coreScriptSyncService = game:GetService("CoreScriptSyncService")

return function(p1, p2, p3)
	-- upvalues: coreScriptSyncService (ref)
	local _game = game
	
	for i, v in string.split(p1, ".") do
		if _game == nil then break end
		_game = _game:FindFirstChild(v)
	end
	if typeof(_game) ~= "Instance" or not _game:IsA("ModuleScript") then
		warn("path led to non-ModuleScript:", p1, _game.ClassName)
		_game = nil
	end
	local substring = nil
	
	if _game then
		substring = coreScriptSyncService:GetScriptFilePath(_game)
		
		if p2 then
			local matchIndex, matchIndex_1 = string.find(substring, p2, 1, true)
			
			if matchIndex then
				substring = string.sub(substring, if p3 then matchIndex else matchIndex_1 + 1)
			end
		end
	end
	return _game, substring
end