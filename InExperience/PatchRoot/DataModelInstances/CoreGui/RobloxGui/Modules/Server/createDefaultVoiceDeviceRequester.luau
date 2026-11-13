return function(p1)
	local t = {}
	local t1 = {}
	
	local function tryCreateDevice(Key)
		-- upvalues: p1 (copy)
		local Success, Result = pcall(p1.isVoiceEnabledAsync, Key)
		
		if not Success then
			p1.log("Error getting voice enabled status for", Key.Name, ": \"", Result, "\"")
			
			return
		end
		p1.log("Voice enabled for", Key.Name, ":", Result)
		
		if Result and p1.isPlayerInGame(Key) then
			xpcall(p1.createDevice, function(Err)
				-- upvalues: p1 (upval), Key (copy)
				p1.log("Error creating voice device for", Key.Name, ": \"", Err, "\"")
			end, Key)
		end
	end
	
	return function(Key)
		-- upvalues: t (copy), t1 (copy), p1 (copy), tryCreateDevice (copy)
		if t[Key] then
			t1[Key] = true
			
			return
		end
		if p1.playerHasDevice(Key) then
			p1.log("Skipping voice device for", Key.Name, "that already has one")
			
			return
		end
		t[Key] = true
		repeat
			t1[Key] = nil
			tryCreateDevice(Key)
		until not t1[Key] or (p1.playerHasDevice(Key) or not p1.isPlayerInGame(Key))
		t[Key] = nil
		t1[Key] = nil
	end
end