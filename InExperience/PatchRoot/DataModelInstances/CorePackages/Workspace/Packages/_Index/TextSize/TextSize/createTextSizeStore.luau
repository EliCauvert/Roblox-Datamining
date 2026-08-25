local textService = game:GetService("TextService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local signalsModule = require(script:FindFirstAncestor("TextSize").Parent.Signals)

local _ = function(p0)
	local thread = coroutine.create(p0)
	
	return (function(p1, p2, ...)
		return if p2 then if coroutine.status(p1) == "dead" then ... else nil else nil
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
	
	return (function(p3, p4, ...)
		return if p4 then if coroutine.status(p3) == "dead" then ... else nil else nil
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
	local var7, var8 = signalsModule.createSignal((function(p5, p6, ...)
		return if p6 then if coroutine.status(p5) == "dead" then ... else nil else nil
	end)(thread, coroutine.resume(thread)) or 0)
	local var9 = userGameSettingsService:GetPropertyChangedSignal("PreferredTextSize"):Connect(function()
		-- upvalues: var8 (ref), textService (copy)
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
		var8((function(p7, p8, ...)
			return if p8 then if coroutine.status(p7) == "dead" then ... else nil else nil
		end)(thread, coroutine.resume(thread)) or 0)
	end)
	
	return {
		getTextSizeOffset = var7,
		cleanup = function()
			-- upvalues: var9 (write)
			if var9 then
				var9:Disconnect()
				var9 = nil
			end
		end
	}
end