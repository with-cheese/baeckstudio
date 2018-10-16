defmodule BsApi.Projects do
  @moduledoc """
  The Projects context.
  """

  import Ecto.Query, warn: false
  alias BsApi.Repo

  alias BsApi.Projects.Work

  @doc """
  Returns the list of works.

  ## Examples

      iex> list_works()
      [%Work{}, ...]

  """
  def list_works do
    Repo.all(Work)
  end

  @doc """
  Gets a single work.

  Raises `Ecto.NoResultsError` if the Work does not exist.

  ## Examples

      iex> get_work!(123)
      %Work{}

      iex> get_work!(456)
      ** (Ecto.NoResultsError)

  """
  def get_work!(id), do: Repo.get!(Work, id)

  @doc """
  Creates a work.

  ## Examples

      iex> create_work(%{field: value})
      {:ok, %Work{}}

      iex> create_work(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_work(attrs \\ %{}) do
    %Work{}
    |> Work.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a work.

  ## Examples

      iex> update_work(work, %{field: new_value})
      {:ok, %Work{}}

      iex> update_work(work, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_work(%Work{} = work, attrs) do
    work
    |> Work.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Work.

  ## Examples

      iex> delete_work(work)
      {:ok, %Work{}}

      iex> delete_work(work)
      {:error, %Ecto.Changeset{}}

  """
  def delete_work(%Work{} = work) do
    Repo.delete(work)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking work changes.

  ## Examples

      iex> change_work(work)
      %Ecto.Changeset{source: %Work{}}

  """
  def change_work(%Work{} = work) do
    Work.changeset(work, %{})
  end

  alias BsApi.Projects.WorkImage

  @doc """
  Returns the list of work_images.

  ## Examples

      iex> list_work_images()
      [%WorkImage{}, ...]

  """
  def list_work_images do
    Repo.all(from wi in WorkImage, where: wi.active == true)
  end

  @doc """
  Gets a single work_image.

  Raises `Ecto.NoResultsError` if the Work image does not exist.

  ## Examples

      iex> get_work_image!(123)
      %WorkImage{}

      iex> get_work_image!(456)
      ** (Ecto.NoResultsError)

  """
  def get_work_image!(id), do: Repo.get!(WorkImage, id)

  @doc """
  Creates a work_image.

  ## Examples

      iex> create_work_image(%{field: value})
      {:ok, %WorkImage{}}

      iex> create_work_image(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_work_image(attrs \\ %{}) do
    %WorkImage{}
    |> WorkImage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a work_image.

  ## Examples

      iex> update_work_image(work_image, %{field: new_value})
      {:ok, %WorkImage{}}

      iex> update_work_image(work_image, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_work_image(%WorkImage{} = work_image, attrs) do
    work_image
    |> WorkImage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a WorkImage.

  ## Examples

      iex> delete_work_image(work_image)
      {:ok, %WorkImage{}}

      iex> delete_work_image(work_image)
      {:error, %Ecto.Changeset{}}

  """
  def delete_work_image(%WorkImage{} = work_image) do
    Repo.delete(work_image)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking work_image changes.

  ## Examples

      iex> change_work_image(work_image)
      %Ecto.Changeset{source: %WorkImage{}}

  """
  def change_work_image(%WorkImage{} = work_image) do
    WorkImage.changeset(work_image, %{})
  end

  alias BsApi.Projects.WorkText

  @doc """
  Returns the list of work_text.

  ## Examples

      iex> list_work_text()
      [%WorkText{}, ...]

  """
  def list_work_text do
    Repo.all(WorkText)
  end

  @doc """
  Gets a single work_text.

  Raises `Ecto.NoResultsError` if the Work text does not exist.

  ## Examples

      iex> get_work_text!(123)
      %WorkText{}

      iex> get_work_text!(456)
      ** (Ecto.NoResultsError)

  """
  def get_work_text!(id), do: Repo.get!(WorkText, id)

  @doc """
  Creates a work_text.

  ## Examples

      iex> create_work_text(%{field: value})
      {:ok, %WorkText{}}

      iex> create_work_text(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_work_text(attrs \\ %{}) do
    %WorkText{}
    |> WorkText.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a work_text.

  ## Examples

      iex> update_work_text(work_text, %{field: new_value})
      {:ok, %WorkText{}}

      iex> update_work_text(work_text, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_work_text(%WorkText{} = work_text, attrs) do
    work_text
    |> WorkText.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a WorkText.

  ## Examples

      iex> delete_work_text(work_text)
      {:ok, %WorkText{}}

      iex> delete_work_text(work_text)
      {:error, %Ecto.Changeset{}}

  """
  def delete_work_text(%WorkText{} = work_text) do
    Repo.delete(work_text)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking work_text changes.

  ## Examples

      iex> change_work_text(work_text)
      %Ecto.Changeset{source: %WorkText{}}

  """
  def change_work_text(%WorkText{} = work_text) do
    WorkText.changeset(work_text, %{})
  end

  alias BsApi.Projects.WorkImagePosition

  @doc """
  Returns the list of work_image_positions.

  ## Examples

      iex> list_work_image_positions()
      [%WorkImagePosition{}, ...]

  """
  def list_work_image_positions do
    Repo.all(WorkImagePosition)
  end

  @doc """
  Gets a single work_image_position.

  Raises `Ecto.NoResultsError` if the Work image position does not exist.

  ## Examples

      iex> get_work_image_position!(123)
      %WorkImagePosition{}

      iex> get_work_image_position!(456)
      ** (Ecto.NoResultsError)

  """
  def get_work_image_position!(id), do: Repo.get!(WorkImagePosition, id)

  @doc """
  Creates a work_image_position.

  ## Examples

      iex> create_work_image_position(%{field: value})
      {:ok, %WorkImagePosition{}}

      iex> create_work_image_position(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_work_image_position(attrs \\ %{}) do
    %WorkImagePosition{}
    |> WorkImagePosition.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a work_image_position.

  ## Examples

      iex> update_work_image_position(work_image_position, %{field: new_value})
      {:ok, %WorkImagePosition{}}

      iex> update_work_image_position(work_image_position, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_work_image_position(%WorkImagePosition{} = work_image_position, attrs) do
    work_image_position
    |> WorkImagePosition.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a WorkImagePosition.

  ## Examples

      iex> delete_work_image_position(work_image_position)
      {:ok, %WorkImagePosition{}}

      iex> delete_work_image_position(work_image_position)
      {:error, %Ecto.Changeset{}}

  """
  def delete_work_image_position(%WorkImagePosition{} = work_image_position) do
    Repo.delete(work_image_position)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking work_image_position changes.

  ## Examples

      iex> change_work_image_position(work_image_position)
      %Ecto.Changeset{source: %WorkImagePosition{}}

  """
  def change_work_image_position(%WorkImagePosition{} = work_image_position) do
    WorkImagePosition.changeset(work_image_position, %{})
  end
end
