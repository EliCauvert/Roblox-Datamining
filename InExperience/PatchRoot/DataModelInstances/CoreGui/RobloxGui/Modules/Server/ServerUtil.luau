local serverCoreScriptSourceCode = game:DefineFastFlag("ServerCoreScriptSourceCode", false)
local t = {
	getFFlagServerCoreScriptSourceCode = function()
		-- upvalues: serverCoreScriptSourceCode (ref)
		return serverCoreScriptSourceCode
	end
}

if serverCoreScriptSourceCode then
	local insertService = game:GetService("InsertService")
	local modules = game:GetService("CoreGui"):WaitForChild("RobloxGui", 1e999).Modules
	
	local function getRelativePathArray(p0, p1)
		local t = {}
		while p1 ~= p0 do
			if p1 ~= nil then
				table.insert(t, 1, p1.Name)
				p1 = p1.Parent
				continue
			end
			return nil
		end
		return t
	end
	
	function t.getSourceForServerScript(p2)
		-- upvalues: modules (ref), getRelativePathArray (ref)
		if p2.Source ~= "" then
			return p2.Source
		end
		local sourceCode = modules.SourceCode
		local var5 = getRelativePathArray(modules, p2)
		
		if var5 == nil then
			error("Instance is not a descendant of the byte code root")
		end
		local var6 = sourceCode
		
		for i = 1, #var5 do
			var6 = var6:FindFirstChild(var5[i])
		end
		if var6 == nil then
			error("No source found for instance")
		end
		return var6.Source
	end
	
	local function _()
		return script.Source == ""
	end
	
	function t.initSourceCodeFolder()
		-- upvalues: insertService (ref), modules (ref)
		if script.Source == "" then
			local var7 = insertService:LoadLocalAsset("rbxasset://models/ServerCoreScripts.rbxm")
			local sourceCode = Instance.new("Folder")
			sourceCode.Name = "SourceCode"
			sourceCode.Parent = modules
			local common = var7.Common
			var7.Server.Parent = sourceCode
			common.Parent = sourceCode
			
			return
		end
	end
end
return t