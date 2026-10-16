local ServerCoreScriptSourceCode = game:DefineFastFlag("ServerCoreScriptSourceCode", false)
local ServerUtil = {
	getFFlagServerCoreScriptSourceCode = function() --[[ Line: 6 ]]
		-- upvalues: ServerCoreScriptSourceCode (copy)
		return ServerCoreScriptSourceCode
	end
}

if ServerCoreScriptSourceCode then
	local InsertService = game:GetService("InsertService")
	local Modules = game:GetService("CoreGui"):WaitForChild("RobloxGui", 1e999).Modules
	
	local function getRelativePathArray(Modules, p1) --[[ Line: 15 ]]
		local List = {}
		while p1 ~= Modules do
			if p1 == nil then
				return nil
			end
			table.insert(List, 1, p1.Name)
			p1 = p1.Parent
		end
		return List
	end
	
	function ServerUtil.getSourceForServerScript(p2) --[[ Line: 27 ]]
		-- upvalues: Modules (copy), getRelativePathArray (copy)
		if p2.Source ~= "" then
			return p2.Source
		end
		local SourceCode = Modules.SourceCode
		local RelativePathArray = getRelativePathArray(Modules, p2)
		
		if RelativePathArray == nil then
			error("Instance is not a descendant of the byte code root")
		end
		local Child = SourceCode
		
		for i = 1, #RelativePathArray do
			Child = Child:FindFirstChild(RelativePathArray[i])
		end
		if Child == nil then
			error("No source found for instance")
		end
		return Child.Source
	end
	
	local function _(): boolean --[[ Line: 52 | Named "isByteCodeMode" ]]
		return script.Source == ""
	end
	
	function ServerUtil.initSourceCodeFolder() --[[ Line: 56 ]]
		-- upvalues: InsertService (copy), Modules (copy)
		if script.Source == "" then
			local ServerCoreScriptsRbxm = InsertService:LoadLocalAsset("rbxasset://models/ServerCoreScripts.rbxm")
			local SourceCode = Instance.new("Folder")
			SourceCode.Name = "SourceCode"
			SourceCode.Parent = Modules
			ServerCoreScriptsRbxm.Server.Parent = SourceCode
			ServerCoreScriptsRbxm.Common.Parent = SourceCode
			
			return
		end
	end
end
return ServerUtil