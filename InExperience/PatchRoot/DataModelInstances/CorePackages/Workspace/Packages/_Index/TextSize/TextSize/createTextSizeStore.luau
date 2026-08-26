local textService = game:GetService("TextService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local signalsModule = require(script:FindFirstAncestor("TextSize").Parent.Signals)

local _ = function(p1)
	local thread = coroutine.create(p1)
	
	return (function(p2, p3, ...)
		return if p3 then if coroutine.status(p2) == "dead" then ... else nil else nil
	end)(thread, coroutine.resume(thread))
end

local function _()
	-- upvalues: textService (ref)
	local thread = coroutine.create(function()
		-- upvalues: textService (copy)
		local font = Font.fromEnum(Enum.Font.BuilderSans)
		local ok, status = pcall(function()
			-- upvalues: textService (copy), font (ref)
			return textService:GetTextSizeOffsetAsync(0, font)
		end)
		
		if ok then
			return status or 0
		end
		warn(status)
		
		return 0
	end)
	
	return (function(p1, p2, ...)
		return if p2 then if coroutine.status(p1) == "dead" then ... else nil else nil
	end)(thread, coroutine.resume(thread)) or 0
end

return function()
	-- upvalues: signalsModule (ref), textService (ref), userGameSettingsService (ref)
	local thread = coroutine.create(function()
		-- upvalues: textService (copy)
		local font = Font.fromEnum(Enum.Font.BuilderSans)
		local ok, status = pcall(function()
			-- upvalues: textService (copy), font (ref)
			return textService:GetTextSizeOffsetAsync(0, font)
		end)
		
		if ok then
			return status or 0
		end
		warn(status)
		
		return 0
	end)
	local var1, var2 = signalsModule.createSignal((function(p1, p2, ...)
		return if p2 then if coroutine.status(p1) == "dead" then ... else nil else nil
	end)(thread, coroutine.resume(thread)) or 0)
	local var3 = userGameSettingsService:GetPropertyChangedSignal("PreferredTextSize"):Connect(function()
		-- upvalues: var2 (ref), textService (copy)
		local thread = coroutine.create(function()
			-- upvalues: textService (copy)
			local font = Font.fromEnum(Enum.Font.BuilderSans)
			local ok, status = pcall(function()
				-- upvalues: textService (copy), font (ref)
				return textService:GetTextSizeOffsetAsync(0, font)
			end)
			
			if ok then
				return status or 0
			end
			warn(status)
			
			return 0
		end)
		var2((function(p1, p2, ...)
			return if p2 then if coroutine.status(p1) == "dead" then ... else nil else nil
		end)(thread, coroutine.resume(thread)) or 0)
	end)
	
	return {
		getTextSizeOffset = var1,
		cleanup = function()
			-- upvalues: var3 (write)
			if var3 then
				var3:Disconnect()
				var3 = nil
			end
		end
	}
end