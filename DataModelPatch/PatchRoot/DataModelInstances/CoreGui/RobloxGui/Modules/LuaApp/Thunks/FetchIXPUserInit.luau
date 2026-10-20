local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local PromiseModule = require(Modules.LuaApp.Promise)
local FetchIXPUserInitModule = {}

local function _(p1, p2): string
	return "IXPFetchUserInit" .. tostring(p1) .. tostring(p2)
end

function FetchIXPUserInitModule.Fetch(IXPService, p1, p2)
	-- upvalues: PerformFetch (copy), PromiseModule (copy), ArgCheckModule (copy), FetchIXPUserInitModule (copy), RetrievalStatus (copy)
	return PerformFetch.Single("IXPFetchUserInit" .. tostring(p1) .. tostring(IXPService), function(p3)
		-- upvalues: IXPService (copy), PromiseModule (upval), ArgCheckModule (upval), p1 (copy), FetchIXPUserInitModule (upval), p2 (copy), PerformFetch (upval), RetrievalStatus (upval)
		if not IXPService then
			return PromiseModule.reject()
		end
		ArgCheckModule.isInTypes(p1, { "number", "string" }, "userId")
		
		if typeof(p1) == "string" then
			ArgCheckModule.isNonEmptyString(p1, "userId")
		end
		ArgCheckModule.assert(FetchIXPUserInitModule.IsValidUserIdForIxp(p1), string.format("expects %s to be a number or string representing a positive number!", p1))
		IXPService:InitializeUserLayers(tonumber(p1) or 0)
		
		if IXPService:GetUserLayerLoadingStatus() == Enum.IXPLoadingStatus.Pending then
			local OnUserLayerLoadingStatusChangedConnection = nil
			local Flag = false
			
			return PromiseModule.new(function(Callback1, Callback)
				-- upvalues: p2 (upval), Flag (ref), PerformFetch (upval), p3 (copy), p1 (upval), IXPService (upval), RetrievalStatus (upval), OnUserLayerLoadingStatusChangedConnection (ref)
				if p2 then
					delay(p2, function()
						-- upvalues: Flag (upval), PerformFetch (upval), p3 (upval), p1 (upval), IXPService (upval), RetrievalStatus (upval), OnUserLayerLoadingStatusChangedConnection (upval), Callback (copy)
						if Flag then return end
						local Status = PerformFetch.GetStatus(p3:getState(), "IXPFetchUserInit" .. tostring(p1) .. tostring(IXPService))
						
						if Status ~= RetrievalStatus.Done and Status ~= RetrievalStatus.Failed then
							if OnUserLayerLoadingStatusChangedConnection then
								OnUserLayerLoadingStatusChangedConnection:disconnect()
								OnUserLayerLoadingStatusChangedConnection = nil
							end
							Callback()
						end
					end)
				end
				OnUserLayerLoadingStatusChangedConnection = IXPService.OnUserLayerLoadingStatusChanged:Connect(function(_)
					-- upvalues: IXPService (upval), Flag (upval), OnUserLayerLoadingStatusChangedConnection (upval), Callback1 (copy)
					if IXPService:GetUserLayerLoadingStatus() ~= Enum.IXPLoadingStatus.Pending then
						Flag = true
						
						if OnUserLayerLoadingStatusChangedConnection then
							OnUserLayerLoadingStatusChangedConnection:disconnect()
							OnUserLayerLoadingStatusChangedConnection = nil
						end
						Callback1()
					end
				end)
			end)
		else
			return PromiseModule.resolve()
		end
	end)
end

function FetchIXPUserInitModule.GetFetchingStatus(p1, p2, p3)
	-- upvalues: PerformFetch (copy)
	return PerformFetch.GetStatus(p1, "IXPFetchUserInit" .. tostring(p2) .. tostring(p3))
end

function FetchIXPUserInitModule.IsValidUserIdForIxp(p1): boolean
	return p1 ~= nil and (p1 ~= "" and (p1 ~= "-1" and (p1 ~= "0" and (p1 ~= -1 and p1 ~= 0))))
end

return FetchIXPUserInitModule