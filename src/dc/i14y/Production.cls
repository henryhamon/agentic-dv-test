Class dc.i14y.Production  Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="dc.i14y.Production" TestingEnabled="true" LogGeneralTraceEvents="false">
    <Description>Ambiente Simulado</Description>
    <ActorPoolSize>2</ActorPoolSize>
    
    <Item Name="i14y.API" Category="Sample" ClassName="dc.i14y.service.Rest" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    </Item>
</Production>
}
}