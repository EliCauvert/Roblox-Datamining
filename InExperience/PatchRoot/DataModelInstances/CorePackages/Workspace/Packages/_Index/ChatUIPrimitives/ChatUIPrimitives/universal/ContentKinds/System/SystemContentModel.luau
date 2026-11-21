local _ = require(script.Parent.Parent.Parent.Types)
local _ = require(script.Parent.SystemTypes)
local UnpackContentModule = require(script.Parent.Parent.unpackContent)
local SystemContentModelModule = {
	fromSystem = function(Text, IconName)
		return { system = { text = Text, iconName = IconName } }
	end
}

function SystemContentModelModule.fromRichText(p1, IconName)
	-- upvalues: SystemContentModelModule (copy)
	local FromSystemResult = SystemContentModelModule.fromSystem(p1, IconName)
	FromSystemResult.system.richText = true
	
	return FromSystemResult
end

function SystemContentModelModule.getDetail(p1)
	return p1.system
end

function SystemContentModelModule.isSystemMessage(p1): boolean
	-- upvalues: UnpackContentModule (copy)
	local Content = p1.contents[1]
	
	return Content ~= nil and UnpackContentModule(Content) == "system"
end

return SystemContentModelModule