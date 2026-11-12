local CloudClientSessionApiEngineFeature = game:GetEngineFeature("CloudClientSessionApi")

return function(p1)
	-- upvalues: CloudClientSessionApiEngineFeature (copy)
	return if CloudClientSessionApiEngineFeature then (p1 or game):GetService("CloudClientService") else nil
end