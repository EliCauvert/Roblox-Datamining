local TextService = game:GetService("TextService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Parent = script:FindFirstAncestor("TextSize").Parent
local FoundationModule = require(Parent.Foundation)
local SignalsModule = require(Parent.Signals)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration

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
	-- upvalues: SignalsModule (copy), FoundationFontFaceMigration (copy), FoundationModule (copy), TextService (copy), UserGameSettings (copy)
	local CreateSignalFunction = SignalsModule.createSignal
	local TextSizeOffset = nil
	
	if FoundationFontFaceMigration then
		TextSizeOffset = FoundationModule.Utility.getTextSizeOffset() or 0
	else
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
		TextSizeOffset = (function(Thread, p1, ...)
			return if p1 and coroutine.status(Thread) == "dead" then ... else nil
		end)(Thread, coroutine.resume(Thread)) or 0
	end
	local Signal, Signal2 = CreateSignalFunction(TextSizeOffset)
	local Connection = UserGameSettings:GetPropertyChangedSignal("PreferredTextSize"):Connect(function()
		-- upvalues: Signal2 (copy), FoundationFontFaceMigration (upval), FoundationModule (upval), TextService (upval)
		local TextSizeOffset = nil
		if FoundationFontFaceMigration then
			TextSizeOffset = FoundationModule.Utility.getTextSizeOffset() or 0
		else
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
			TextSizeOffset = (function(Thread, p1, ...)
				return if p1 and coroutine.status(Thread) == "dead" then ... else nil
			end)(Thread, coroutine.resume(Thread)) or 0
		end
		Signal2(TextSizeOffset)
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