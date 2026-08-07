local coreScriptSyncService = game:GetService("CoreScriptSyncService")

return function(p0, p1, p2) --[[ line: 4 | named "getFileInfo" ]]
	-- upvalues: coreScriptSyncService (ref)
	local _game = game
	
	for i, v in string.split(p0, ".") do
		if _game == nil then break end
		_game = _game:FindFirstChild(v)
	end
	if typeof(_game) ~= "Instance" or not _game:IsA("ModuleScript") then
		warn("path led to non-ModuleScript:", p0, _game.ClassName)
		_game = nil
	end
	local substring = nil
	
	if _game then
		substring = coreScriptSyncService:GetScriptFilePath(_game)
		
		if p1 then
			local matchIndex, matchIndex_1 = string.find(substring, p1, 1, true)
			
			if matchIndex then
				substring = string.sub(substring, if p2 then matchIndex else matchIndex_1 + 1)
			end
		end
	end
	return _game, substring
end