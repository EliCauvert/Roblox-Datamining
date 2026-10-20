local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoduxModule = require(CorePackages.Packages.Rodux)
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local SafeCallModule = require(Modules.LuaApp.Util.safeCall)
local ToStringLimitedModule = require(Modules.LuaApp.Util.toStringLimited)
local StringReplaceAllModule = require(Modules.Common.StringUtilities.StringReplaceAll)
local LuaAppEnableLumberyakLogBound = game:DefineFastFlag("LuaAppEnableLumberyakLogBound", false)
local LuaAppLumberyakLogBound = game:DefineFastInt("LuaAppLumberyakLogBound", 10000)
local LuaAppBacktraceLoggerModule = { _store = nil, _lumberyakLog = "" }

if LuaAppEnableLumberyakLogBound then
	LuaAppBacktraceLoggerModule._lumberyakBuffer = table.create(LuaAppLumberyakLogBound)
	LuaAppBacktraceLoggerModule._currentBufferIndex = 1
end
LuaAppBacktraceLoggerModule.addLumberyakLog = nil
Logger:addSink({
	maxLevel = Logger.Levels.fromString((game:DefineFastString("LuaAppBacktraceLogLevel", "Info"))),
	log = function(_, p1, _)
		-- upvalues: LuaAppBacktraceLoggerModule (copy)
		LuaAppBacktraceLoggerModule:addLumberyakLog(p1)
	end
})

function LuaAppBacktraceLoggerModule.connectToStore(p1, _store)
	-- upvalues: RoduxModule (copy)
	if getmetatable(_store) == RoduxModule.Store then
		p1._store = _store
	end
end

function LuaAppBacktraceLoggerModule.addLumberyakLog(p1, Text)
	-- upvalues: LuaAppEnableLumberyakLogBound (copy), LuaAppLumberyakLogBound (copy)
	if type(Text) == "string" then
		if LuaAppEnableLumberyakLogBound then
			p1._lumberyakBuffer[p1._currentBufferIndex] = Text
			p1._currentBufferIndex += 1
			
			if LuaAppLumberyakLogBound < p1._currentBufferIndex then
				p1._currentBufferIndex = 1
				
				return
			end
		else
			p1._lumberyakLog ..= Text .. "\n"
		end
	end
end

function LuaAppBacktraceLoggerModule.generateAppLog(p1)
	-- upvalues: SafeCallModule (copy), LuaAppEnableLumberyakLogBound (copy), ToStringLimitedModule (copy), Players (copy), StringReplaceAllModule (copy)
	return (SafeCallModule(function()
		-- upvalues: LuaAppEnableLumberyakLogBound (upval), p1 (copy), ToStringLimitedModule (upval), Players (upval), StringReplaceAllModule (upval)
		local Text = ""
		
		if LuaAppEnableLumberyakLogBound then
			if #p1._lumberyakBuffer > 0 then
				Text = ((Text .. "============ LumberYak Logs ============\n") .. table.concat(p1._lumberyakBuffer, "\n", p1._currentBufferIndex)) .. "\n" .. table.concat(p1._lumberyakBuffer, "\n", 1, p1._currentBufferIndex - 1)
			end
		elseif #p1._lumberyakLog > 0 then
			Text = (Text .. "============ LumberYak Logs ============\n") .. p1._lumberyakLog
		end
		if p1._store ~= nil then
			local StringLimitedModule = ToStringLimitedModule(p1._store:getState(), nil, 5, function(p2): number
				return if p2 == 1 then -1 else 20
			end)
			
			if #StringLimitedModule > 0 then
				Text = (Text .. "============ Rodux Store ============\n") .. StringLimitedModule
			end
		end
		local t = {}
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer ~= nil then
			if LocalPlayer.UserId and LocalPlayer.UserId > 0 then
				t[tostring(LocalPlayer.UserId)] = "UserId"
			end
			if LocalPlayer.Name and LocalPlayer.Name ~= "" then
				t[tostring(LocalPlayer.Name)] = "UserName"
			end
		end
		return (StringReplaceAllModule(Text, t))
	end, ""))
end

return LuaAppBacktraceLoggerModule