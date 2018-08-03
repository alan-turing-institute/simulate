Creating a new Case
===================

The framework for creating a particular type of simulation job is called a **Case**.  A case definition
contains information about:

- The backend simulator to be used.
- The general type of simulation (e.g. 'mixing two fluids in a tank').
- What parameters can be varied within the simulation, including minimum and maximum limits, and default values.
- Location of scripts that will be used by the backend, and information about which one(s) should be executed to run the job.

It is intended that a relatively simple *json* structure can be used to specify a Case.

The following terms are used in relation to cases in SiMulate:

- **Case**:  top-level item.  Contains *CaseFields*.
- **CaseField**: Component of a Case.  Can correspond to either a particular parameter (e.g. surface tension), or an object that itself has a set of parameters.  In the latter case, the parameters of the object would also be CaseFields.  For example, a fluid can be a CaseField, and would contain CaseFields describing its density and viscosity.  A CaseField describing a single parameter will contain several *ParamSpecs*.
- **ParameterSpec**: A piece of metadata about a particular parameter.  Has a *name* ("min", "max", "default", or "units"), a "value", and a parent CaseField.
- **Job**: an individual instance of a fully-configured Case, which is to be run on the simulator.
