type Constants = {
	PLUGIN_ID: string;
	PLUGIN_NAME: string;
}
return function ()
	return script.Parent.Parent:GetAttributes() :: Constants
end