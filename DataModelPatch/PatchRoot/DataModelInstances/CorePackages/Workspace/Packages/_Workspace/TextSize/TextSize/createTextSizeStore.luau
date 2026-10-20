local TextService = game:GetService("TextService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local SignalsModule = require(script:FindFirstAncestor("TextSize").Parent.Signals)

local function _(Callback)
	local Thread = coroutine.create(Callback)
	
	return (function(Thread, p1, ...)
		return if p1 and coroutine.status(Thread) == "dead" then ... else nil
	end)(Thread, coroutine.resume(Thread))
end

local _ = function()
	-- upvalues: TextService (copy)
	local Thread = coroutine.create(function()
		-- upvalues: TextService (upval)
		local _Font = Font.fromEnum(Enum.Font.BuilderSans)
		local Success, Result = pcall(function()
			-- upvalues: TextService (upval), _Font (copy)
			return TextService:GetTextSizeOffsetAsync(0, _Font)
		end)
		
		if Success then
			return Result or 0
		else
			warn(Result)
			
			return 0
		end
	end)
	
	return (function(Thread, p1, ...)
		return if p1 and coroutine.status(Thread) == "dead" then ... else nil
	end)(Thread, coroutine.resume(Thread)) or 0
end

return function()
	-- upvalues: SignalsModule (copy), TextService (copy), UserGameSettings (copy)
	local Thread = coroutine.create(function()
		-- upvalues: TextService (upval)
		local _Font = Font.fromEnum(Enum.Font.BuilderSans)
		local Success, Result = pcall(function()
			-- upvalues: TextService (upval), _Font (copy)
			return TextService:GetTextSizeOffsetAsync(0, _Font)
		end)
		
		if Success then
			return Result or 0
		else
			warn(Result)
			
			return 0
		end
	end)
	local Signal, Signal2 = SignalsModule.createSignal((function(Thread, p1, ...)
		return if p1 and coroutine.status(Thread) == "dead" then ... else nil
	end)(Thread, coroutine.resume(Thread)) or 0)
	local Connection = UserGameSettings:GetPropertyChangedSignal("PreferredTextSize"):Connect(function()
		-- upvalues: Signal2 (copy), TextService (upval)
		local Thread = coroutine.create(function()
			-- upvalues: TextService (upval)
			local _Font = Font.fromEnum(Enum.Font.BuilderSans)
			local Success, Result = pcall(function()
				-- upvalues: TextService (upval), _Font (copy)
				return TextService:GetTextSizeOffsetAsync(0, _Font)
			end)
			
			if Success then
				return Result or 0
			else
				warn(Result)
				
				return 0
			end
		end)
		Signal2((function(Thread, p1, ...)
			return if p1 and coroutine.status(Thread) == "dead" then ... else nil
		end)(Thread, coroutine.resume(Thread)) or 0)
	end)
	
	return {
		getTextSizeOffset = Signal,
		cleanup = function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
	}
end